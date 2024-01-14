# Verilog Generation Configuration
##################################

STARSHIP_CORE	?= Rocket
STARSHIP_FREQ	?= 100
STARSHIP_TH 	?= starship.fpga.TestHarness
STARSHIP_TOP	?= starship.fpga.StarshipFPGATop
STARSHIP_CONFIG	?= starship.fpga.StarshipFPGAConfig


# FPGA Configuration
####################

STARSHIP_BOARD	?= vc707


# Simulation Configuration
##########################

STARSHIP_TESTCASE	?= $(BUILD)/starship-dummy-testcase
STARSHIP_ROM		?= $(MEM_INIT_DIR)/dummy.hex

$(BUILD)/starship-dummy-testcase:
	mkdir -p $(BUILD)
	wget https://github.com/sycuricon/riscv-tests/releases/download/dummy/rv64ui-p-simple -O $@
