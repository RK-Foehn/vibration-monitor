import numpy as np

# -----------------------------
# 1. 基本参数
# -----------------------------
fs = 12800
N = 2048

rpm_list = [
    1200,
    1500,
    1800,
    2100,
    2400
]

t = np.arange(N) / fs

df = fs / N

print("===== RPM Sweep Test =====")
print(f"FFT Resolution: {df:.2f} Hz")
print()

print(
    f"{'RPM':>6} "
    f"{'True Freq':>12} "
    f"{'FFT Bin':>12} "
    f"{'Estimated':>12} "
    f"{'Error':>10}"
)

# -----------------------------
# 2. 逐个测试不同转速
# -----------------------------
for rpm in rpm_list:

    # 理论旋转频率
    f_rot = rpm / 60

    # -------------------------
    # 生成模拟振动信号
    # -------------------------
    signal_1x = (
        1.0
        * np.sin(2 * np.pi * f_rot * t)
    )

    signal_2x = (
        0.3
        * np.sin(2 * np.pi * 2 * f_rot * t)
    )

    # 暂时不加随机噪声
    x = signal_1x + signal_2x

    # -------------------------
    # 去直流 + Hann窗
    # -------------------------
    x_centered = x - np.mean(x)

    window = np.hanning(N)

    X = np.fft.rfft(
        x_centered * window
    )

    amplitude = np.abs(X)

    freq = np.fft.rfftfreq(
        N,
        d=1 / fs
    )

    # -------------------------
    # 找主峰
    # -------------------------
    peak_index = (
        np.argmax(amplitude[1:]) + 1
    )

    fft_bin_frequency = freq[peak_index]

    # -------------------------
    # 抛物线峰值插值
    # -------------------------
    alpha = amplitude[peak_index - 1]
    beta = amplitude[peak_index]
    gamma = amplitude[peak_index + 1]

    delta = (
        0.5
        * (alpha - gamma)
        / (alpha - 2 * beta + gamma)
    )

    estimated_frequency = (
        peak_index + delta
    ) * df

    # -------------------------
    # 计算估计误差
    # -------------------------
    error = (
        estimated_frequency - f_rot
    )

    # -------------------------
    # 输出
    # -------------------------
    print(
        f"{rpm:>6} "
        f"{f_rot:>12.2f} "
        f"{fft_bin_frequency:>12.2f} "
        f"{estimated_frequency:>12.2f} "
        f"{error:>10.2f}"
    )