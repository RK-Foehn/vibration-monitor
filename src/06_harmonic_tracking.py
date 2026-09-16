import numpy as np

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

# 去直流 + 加窗
x_centered = x - np.mean(x)
window = np.hanning(N)

X = np.fft.rfft(x_centered * window)

freq = np.fft.rfftfreq(N, d=1 / fs)
amplitude = np.abs(X)

df = fs / N

# -----------------------------
# 1. 找主峰
# -----------------------------
peak_index = np.argmax(amplitude[1:]) + 1

alpha = amplitude[peak_index - 1]
beta = amplitude[peak_index]
gamma = amplitude[peak_index + 1]

delta = 0.5 * (alpha - gamma) / (
    alpha - 2 * beta + gamma
)

# 插值后的 1X 频率
f_1x_est = (peak_index + delta) * df

# -----------------------------
# 2. 根据估计的 1X 推算 2X
# -----------------------------
f_2x_target = 2 * f_1x_est

# 找最接近 2X 的 FFT bin
index_2x = np.argmin(
    np.abs(freq - f_2x_target)
)

f_2x_bin = freq[index_2x]
amp_2x = amplitude[index_2x]

amp_1x = beta

ratio_2x_1x = amp_2x / amp_1x

# -----------------------------
# 3. 输出
# -----------------------------
print("===== Harmonic Tracking =====")
print(f"FFT Resolution:        {df:.2f} Hz")
print()

print(f"1X FFT Bin:            {freq[peak_index]:.2f} Hz")
print(f"1X Estimated Freq:     {f_1x_est:.2f} Hz")
print(f"1X Amplitude:          {amp_1x:.2f}")

print()

print(f"2X Target Freq:        {f_2x_target:.2f} Hz")
print(f"2X FFT Bin:            {f_2x_bin:.2f} Hz")
print(f"2X Amplitude:          {amp_2x:.2f}")

print()

print(f"2X / 1X Ratio:         {ratio_2x_1x:.3f}")