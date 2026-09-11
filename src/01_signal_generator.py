import numpy as np

# -----------------------------
# 1. 基本参数
# -----------------------------
fs = 12800          # 采样率：12800 Hz
N = 2048            # 一共生成 2048 个采样点

rpm = 1800          # 假设电机转速 1800 rpm
f_rot = rpm / 60    # 转频：1800 / 60 = 30 Hz

# -----------------------------
# 2. 建立时间轴
# -----------------------------
t = np.arange(N) / fs

# -----------------------------
# 3. 生成模拟振动信号
# -----------------------------
signal_1x = 1.0 * np.sin(2 * np.pi * f_rot * t)
signal_2x = 0.3 * np.sin(2 * np.pi * 2 * f_rot * t)

noise = 0.05 * np.random.randn(N)

x = signal_1x + signal_2x + noise

# -----------------------------
# 4. 保存为 CSV 文件
# -----------------------------
data = np.column_stack((t, x))

np.savetxt(
    "data/simulated/vibration_test.csv",
    data,
    delimiter=",",
    header="time,acceleration",
    comments=""
)

print("Signal generated successfully.")
print(f"Sampling rate: {fs} Hz")
print(f"Samples: {N}")
print(f"Motor speed: {rpm} rpm")
print(f"Rotating frequency: {f_rot} Hz")
print("Saved to: data/simulated/vibration_test.csv")