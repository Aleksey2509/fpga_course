# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/NCO.v
# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the na11:me of the toplevel module in your Verilog or VHDL file
TOPLEVEL = NCO

# MODULE is the basename of the Python test file
MODULE = nco_tb

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim



