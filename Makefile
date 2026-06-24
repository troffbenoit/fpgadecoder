PROJECT = ./decoder.alp
TEST = ls138_tb.bank_decode_test

.PHONY: check build sim list clean

check:
	alchitry check $(PROJECT)

build:
	alchitry build $(PROJECT)

list:
	alchitry sim $(PROJECT) --list

sim:
	alchitry sim $(PROJECT) --tests $(TEST)

clean:
	rm -rf build


