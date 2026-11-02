"""Tk desktop monitor; validated UART records, no motor diagnosis before calibration."""
import argparse
from collections import deque
from datetime import datetime
import math
from pathlib import Path
import time
import tkinter as tk
from tkinter import ttk
import serial
from serial.tools import list_ports
from receiver import Capture


class Monitor:
    def __init__(self, root, port):
        self.root = root
        self.stream = self.capture = None
        self.last = 0
        self.history = deque(maxlen=240)
        root.title('Zynq 振动采集 · 实测窗口')
        root.geometry('1050x720')
        root.configure(bg='#eef2f6')
        bar = ttk.Frame(root, padding=12); bar.pack(fill='x')
        ttk.Label(bar, text='串口').pack(side='left')
        self.port = tk.StringVar(value=port)
        ttk.Combobox(bar, textvariable=self.port, values=[p.device for p in list_ports.comports()], width=12).pack(side='left', padx=8)
        ttk.Button(bar, text='连接并保存', command=self.connect).pack(side='left', padx=4)
        ttk.Button(bar, text='停止并保存', command=self.stop).pack(side='left', padx=4)
        ttk.Label(bar, text='115200 · 8N1 · X轴 / 16点窗口').pack(side='right')
        self.values = tk.StringVar(value='等待串口连接')
        ttk.Label(root, textvariable=self.values, font=('Microsoft YaHei', 17), padding=14).pack(fill='x')
        self.state = tk.StringVar(value='电机状态：未标定，暂不判断正常/异常')
        ttk.Label(root, textvariable=self.state, wraplength=1000, padding=12).pack(fill='x')
        self.canvas = tk.Canvas(root, bg='white', highlightthickness=0)
        self.canvas.pack(fill='both', expand=True, padx=16)
        ttk.Label(root, text='蓝色：Peak  |  橙色：原始 RMS = √(平方和/样本数)，包含重力与直流分量；单位 raw count。', padding=10).pack(fill='x')
        self.info = tk.StringVar(value='自动保存 windows.csv、原始串口字节和事件日志。趋势最多显示最近240条。')
        ttk.Label(root, textvariable=self.info, wraplength=1000, padding=10).pack(fill='x')
        root.protocol('WM_DELETE_WINDOW', self.close)
        root.after(100, self.tick)

    def connect(self):
        self.stop()
        try:
            self.stream = serial.Serial(self.port.get(),115200,timeout=0)
            directory = Path(__file__).parent/'captures'/datetime.now().strftime('%Y%m%d_%H%M%S_%f')
            self.capture = Capture(directory)
            self.history.clear(); self.last=0
            self.info.set(str(directory.resolve()))
            self.state.set('等待固件协议头（最多约10秒）；电机状态：未标定')
        except Exception as e:
            self.stop(); self.state.set('连接失败：'+str(e))

    def stop(self):
        if self.stream: self.stream.close(); self.stream=None
        if self.capture:
            self.info.set(f'已保存 {self.capture.count} 条，拒绝 {self.capture.rejected} 行：{self.capture.directory.resolve()}')
            self.capture.close(); self.capture=None
        self.state.set('已停止；电机状态：未标定')

    def tick(self):
        if self.stream and self.capture:
            try:
                before=self.capture.count
                self.capture.feed(self.stream.read(min(self.stream.in_waiting,65536)))
                if self.capture.count>before:
                    r=self.capture.latest; self.last=time.monotonic()
                    rms=math.sqrt(r['total']/r['n'])
                    self.history.append((self.last,r['peak'],rms))
                    self.values.set(f"Peak  {r['peak']}     原始 RMS  {rms:.2f}     SEQ  {r['seq']}     样本数  {r['n']}")
                    flags=[]
                    for bit,label in [(2,'初始化错误'),(4,'传感器 overrun'),(8,'FIFO overflow')]:
                        if r['status']&bit: flags.append(label)
                    if not r['status']&1: flags.append('初始化未完成')
                    if r['drops']: flags.append('丢帧计数非零')
                    msg='采集告警：'+', '.join(flags) if flags else '采集状态位未报告错误'
                    self.state.set(f"{msg} | STATUS=0x{r['status']:02X} | DROP={r['drops']} | PS跳过窗口={r['skipped']}（轮询间隔）\n来源={r['source']}；电机状态：未标定")
                    self.draw()
                elif self.last and time.monotonic()-self.last>3:
                    self.state.set('数据已超过3秒未更新；请检查连接。电机状态：未知')
            except Exception as e:
                self.stop(); self.state.set('串口异常：'+str(e))
        self.root.after(100,self.tick)

    def draw(self):
        c=self.canvas; c.delete('all')
        w=max(c.winfo_width(),300); h=max(c.winfo_height(),200)
        values=list(self.history)
        if not values: return
        top=max(1,max(max(r[1:]) for r in values))*1.15
        span=max(10,values[-1][0]-values[0][0])
        for i in range(5):
            y=25+(h-65)*i/4
            c.create_line(65,y,w-20,y,fill='#e0e5eb')
            c.create_text(57,y,text=f'{top*(1-i/4):.0f}',anchor='e')
        c.create_text(w/2,h-15,text='时间（秒，相对本次显示起点）')
        for i in range(5):
            x=65+(w-85)*i/4
            c.create_text(x,h-38,text=f'{span*i/4:.0f}')
        for index,color in [(1,'#2563eb'),(2,'#ea580c')]:
            points=[]
            for row in values:
                points.extend([65+(w-85)*(row[0]-values[0][0])/span,25+(h-65)*(1-row[index]/top)])
            if len(points)>=4: c.create_line(*points,fill=color,width=2)

    def close(self):
        self.stop(); self.root.destroy()

if __name__=='__main__':
    parser=argparse.ArgumentParser(); parser.add_argument('--port',default='COM3'); parser.add_argument('--connect',action='store_true')
    args=parser.parse_args(); root=tk.Tk(); app=Monitor(root,args.port)
    if args.connect: root.after(250,app.connect)
    root.mainloop()
