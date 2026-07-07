PROJECT = ./decoder.alp
TEST = ls138_tb.bank_decode_test

.PHONY: help check build load list sim clean

help:
	@echo "Available targets:"
	@echo "  make check  - Check Lucid project"
	@echo "  make build  - Build FPGA bitstream"
	@echo "  make load   - Load FPGA"
	@echo "  make list   - List simulation tests"
	@echo "  make sim    - Run selected simulation test"
	@echo "  make clean  - Remove build directory"

check:
	alchitry check $(PROJECT)

build:
	alchitry build $(PROJECT)

load:
	alchitry load $(PROJECT)

list:
	alchitry sim $(PROJECT) --list

sim:
	alchitry sim $(PROJECT) --tests $(TEST)

clean:
	rm -rf build


