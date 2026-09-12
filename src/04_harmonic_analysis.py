import numpy as np

# -----------------------------
# 1. 读取数据
# -----------------------------
data = np.loadtxt(
    "data/simulated/vibration_test.csv",
    delimiter=",",
    skiprows=1
)

t = data[:, 0]
x = data[:, 1]

N = len(x)

dt = t[1] - t[0]
fs = 1 / dt

# -----------------------------
# 2. 去直流 + 加窗
# -----------------------------
x_centered = x - np.mean(x)

window = np.hanning(N)
x_windowed = x_centered * window

# -----------------------------
# 3. FFT
# -----------------------------
X = np.fft.rfft(x_windowed)

freq = np.fft.rfftfreq(
    N,
    d=1 / fs
)

amplitude = np.abs(X)

# -----------------------------
# 4. 根据转速计算理论转频
# -----------------------------
rpm = 1800

f_rot = rpm / 60

target_1x = f_rot
target_2x = 2 * f_rot

# -----------------------------
# 5. 找距离理论频率最近的 FFT 点
# -----------------------------
index_1x = np.argmin(
    np.abs(freq - target_1x)
)

index_2x = np.argmin(
    np.abs(freq - target_2x)
)

f_1x = freq[index_1x]
amp_1x = amplitude[index_1x]

f_2x = freq[index_2x]
amp_2x = amplitude[index_2x]

# -----------------------------
# 6. 计算 2× / 1× 比值
# -----------------------------
ratio_2x_1x = amp_2x / amp_1x

# -----------------------------
# 7. 输出
# -----------------------------
print("===== Harmonic Analysis =====")
print(f"Motor Speed:      {rpm} rpm")
print(f"Rotating Freq:    {f_rot:.2f} Hz")
print(f"FFT Resolution:   {fs / N:.2f} Hz")

print()

print(f"1X Target:        {target_1x:.2f} Hz")
print(f"1X FFT Bin:       {f_1x:.2f} Hz")
print(f"1X Amplitude:     {amp_1x:.2f}")

print()

print(f"2X Target:        {target_2x:.2f} Hz")
print(f"2X FFT Bin:       {f_2x:.2f} Hz")
print(f"2X Amplitude:     {amp_2x:.2f}")

print()

print(f"2X / 1X Ratio:    {ratio_2x_1x:.3f}")