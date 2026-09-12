import numpy as np

# 读取数据
data = np.loadtxt(
    "data/simulated/vibration_test.csv",
    delimiter=",",
    skiprows=1
)

t = data[:, 0]
x = data[:, 1]

N = len(x)

# 采样率
dt = t[1] - t[0]
fs = 1 / dt

# -----------------------------
# 时域特征
# -----------------------------
rms = np.sqrt(np.mean(x ** 2))

peak = np.max(np.abs(x))

peak_to_peak = np.max(x) - np.min(x)

crest_factor = peak / rms

# -----------------------------
# 频域特征
# -----------------------------
x_centered = x - np.mean(x)

window = np.hanning(N)

X = np.fft.rfft(x_centered * window)

freq = np.fft.rfftfreq(
    N,
    d=1 / fs
)

amplitude = np.abs(X)

dominant_index = np.argmax(amplitude[1:]) + 1
dominant_frequency = freq[dominant_index]

# -----------------------------
# 输出结果
# -----------------------------
print("===== Vibration Features =====")
print(f"Samples:              {N}")
print(f"Sampling Rate:        {fs:.2f} Hz")
print()
print(f"RMS:                  {rms:.4f}")
print(f"Peak:                 {peak:.4f}")
print(f"Peak-to-Peak:         {peak_to_peak:.4f}")
print(f"Crest Factor:         {crest_factor:.4f}")
print(f"Dominant Frequency:   {dominant_frequency:.2f} Hz")