#! /usr/bin/env python3


import numpy as np
import matplotlib.pyplot as plt

sinus = np.fromfile('sin_log.data')

plt.plot(sinus)
plt.savefig('Sin example')
plt.show()

spectre = np.fft.fftshift(np.fft.fft(sinus))
amplitude = np.abs(spectre)

amp_db = 10 * np.log10(amplitude)
amps_amount = amp_db.size
freqs = np.arange(start = -amps_amount / 2, stop = amps_amount/ 2)

plt.figure()
plt.plot(freqs, amp_db)
step = 4000
plt.title(f'Step = {step}')
# plt.xlabel('freq, Hz')
plt.ylabel('amlplitude, db')
plt.savefig(f'sin_step{step}dither.png')
plt.show()
