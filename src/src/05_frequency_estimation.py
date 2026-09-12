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
# 2. 去直流 + 加 Hann 窗
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
# 4. 找最大频谱点
# -----------------------------
peak_index = np.argmax(amplitude[1:]) + 1

peak_bin_frequency = freq[peak_index]

# -----------------------------
# 5. 抛物线插值
# -----------------------------
alpha = amplitude[peak_index - 1]
beta = amplitude[peak_index]
gamma = amplitude[peak_index + 1]

delta = 0.5 * (alpha - gamma) / (
    alpha - 2 * beta + gamma
)

estimated_bin = peak_index + delta

frequency_resolution = fs / N

estimated_frequency = (
    estimated_bin * frequency_resolution
)

# -----------------------------
# 6. 输出
# -----------------------------
print("===== Frequency Estimation =====")
print(f"Sampling Rate:          {fs:.2f} Hz")
print(f"FFT Resolution:         {frequency_resolution:.2f} Hz")
print()

print(f"Peak FFT Bin:           {peak_bin_frequency:.2f} Hz")
print(f"Interpolation Offset:   {delta:.4f} bin")
print(f"Estimated Frequency:    {estimated_frequency:.2f} Hz")