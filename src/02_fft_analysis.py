import numpy as np
import matplotlib.pyplot as plt

# -----------------------------
# 1. 读取振动数据
# -----------------------------
data = np.loadtxt(
    "data/simulated/vibration_test.csv",
    delimiter=",",
    skiprows=1
)

t = data[:, 0]      # 第一列：时间
x = data[:, 1]      # 第二列：加速度

N = len(x)

# 根据时间间隔计算采样率
dt = t[1] - t[0]
fs = 1 / dt

print(f"Samples: {N}")
print(f"Sampling rate: {fs:.2f} Hz")

# -----------------------------
# 2. 去除直流分量
# -----------------------------
x = x - np.mean(x)

# -----------------------------
# 3. 加 Hann 窗
# -----------------------------
window = np.hanning(N)
x_windowed = x * window

# -----------------------------
# 4. FFT
# -----------------------------
X = np.fft.rfft(x_windowed)

freq = np.fft.rfftfreq(
    N,
    d=1 / fs
)

# 计算幅值
amplitude = np.abs(X)

# -----------------------------
# 5. 找主频
# -----------------------------
# 忽略 0 Hz
dominant_index = np.argmax(amplitude[1:]) + 1
dominant_frequency = freq[dominant_index]

print(f"Dominant frequency: {dominant_frequency:.2f} Hz")

# -----------------------------
# 6. 画时域波形
# -----------------------------
plt.figure()

plt.plot(t, x)

plt.xlabel("Time (s)")
plt.ylabel("Acceleration")
plt.title("Vibration Signal - Time Domain")

plt.grid()

plt.savefig(
    "results/time_domain.png",
    dpi=150
)

plt.show()

# -----------------------------
# 7. 画频谱
# -----------------------------
plt.figure()

plt.plot(freq, amplitude)

plt.xlabel("Frequency (Hz)")
plt.ylabel("Amplitude")
plt.title("Vibration Signal - Frequency Spectrum")

plt.xlim(0, 200)
plt.grid()

plt.savefig(
    "results/frequency_spectrum.png",
    dpi=150
)

plt.show()