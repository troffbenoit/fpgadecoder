# FPGA 6502 Computer Project

This project is an ongoing FPGA implementation of a 6502-based computer using
the Alchitry Au V2 and Br V2 Wide boards.

The project began as a hardware address-decoder experiment and is gradually
being developed into a complete 6502 processor and computer interface. The
FPGA design is being built and tested incrementally so that each part of the
system can be understood and verified on real hardware before additional
features are added.

## Current Working Hardware

The FPGA currently provides:

- Manual 16-bit address entry using the Alchitry IO V2 DIP switches.
- Automatic single-step 4 KB address generation for decoder testing.
- LS138-style address decoding.
- Active-low chip-select outputs for external:
  - RAM
  - ROM
  - UART-B
  - ACIA
- Four-digit hexadecimal display of the selected address.
- LED status and diagnostic indications.
- UART diagnostic output through the Alchitry USB interface.
- A 1 kHz BR2 hardware heartbeat for oscilloscope and signal-routing tests.
- Initial 6502 CPU register hardware and associated testbench.

## Verified Address Map

| Address Range | Device |
|---------------|--------|
| 0x0000-0x1FFF | RAM |
| 0x5000-0x5FFF | UART-B |
| 0x6000-0x6FFF | ACIA |
| 0x8000-0xFFFF | ROM |

## Verified BR2 Signals

| BR2 Pin | Function |
|---------|----------|
| B24 | RAM_CS_N |
| B28 | UART_B_CS_N |
| B30 | ACIA_CS_N |
| B41 | 1 kHz diagnostic heartbeat |
| B42 | ROM_CS_N |

Signals ending in `_N` are active-low.

## 6502 CPU Development

The project is evolving beyond address decoding into an FPGA implementation
of the 6502 processor itself.

The current CPU register module contains the major 6502 registers:

- Accumulator (A)
- X index register
- Y index register
- Stack pointer (SP)
- Program counter (PC)
- Processor status register (P)

CPU functionality is intentionally being added incrementally. Some registers
and signals may therefore exist before they are used by the rest of the CPU.

The eventual goal is for the FPGA-based 6502 to drive the address, data, and
control buses required to communicate with external memory and peripherals.

## Development Philosophy

This is also a learning project. FPGA concepts are being developed and tested
one step at a time rather than treating the HDL as conventional software.

The general workflow is:

1. Understand the hardware being described.
2. Make one controlled change.
3. Run design checks.
4. Build the FPGA project.
5. Verify important changes on real hardware.
6. Create a Git checkpoint after a known-good milestone.

Known-good hardware behavior should be preserved while new portions of the
6502 computer are developed.
