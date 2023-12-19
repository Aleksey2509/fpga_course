import numpy as np

import cocotb
from cocotb.triggers import FallingEdge, Timer
from cocotb.clock import Clock

# import matplotlib.pyplot as plt


@cocotb.test()
async def test_nco(dut):
    cocotb.start_soon(Clock(dut.clk, 1, units="ns").start())

    dut.step.value = 10;

    dut.rst.value = 1
    await Timer(100, units = 'ns')
    dut.rst.value = 0

    points_amount = 10000
    sin_arr = np.zeros(points_amount)


    for i in range(sin_arr.size):
        await FallingEdge(dut.clk)
        if not (('x' in dut.out.value.binstr) or ('z' in dut.out.value.binstr)):
            sin_arr[i] = dut.out.value.signed_integer

    # spectre = np.fft(sin_arr)
    # amplitude = np.abs(spectre)

    # plt.plot(amplitude)
    
    sin_arr.tofile('sin_log.data')
