###############################################################################
#
#                     FPGA 6502 ADDRESS DECODER PROJECT
#
#                           PROJECT INDEX
#
#                     Stanley Benoit
#
# Revision : 1.0
# Branch   : br-v2-port
#
###############################################################################

PURPOSE
=======

This document is the master index for the FPGA 6502 Address Decoder Project.

Every important document, datasheet, design note, test procedure,
and engineering reference should be listed here.

Think of this file as the table of contents for the entire project.


###############################################################################
DIRECTORY STRUCTURE
###############################################################################

decoder/

├── backups/
│       Previous known-good project backups.
│
├── build/
│       FPGA build output.
│
├── constraint/
│       Alchitry constraint files.
│
├── docs/
│
│   ├── datasheets/
│   │
│   ├── design/
│   │
│   ├── images/
│   │
│   ├── manuals/
│   │
│   └── test/
│
├── scripts/
│       Build and utility scripts.
│
├── source/
│       Lucid source files.
│
└── Makefile


###############################################################################
PROJECT MANUALS
###############################################################################

FPGA_6502_Project_Service_Manual_Rev1.pdf

    Main project documentation.

Git_Cheat_Sheet.md

    Daily Git commands used during development.


###############################################################################
DATA SHEETS
###############################################################################

Alchitry Au V2 Pinout

SN74LS00

SN74LS138

Future additions

    W65C02S CPU

    W65C51 ACIA

    SRAM

    EEPROM / FLASH

    Artix-7 FPGA


###############################################################################
DESIGN DOCUMENTS
###############################################################################

Future Documents

memory_map.md

switch_mapping.md

ls138_decode.md

address_bus.md

br2_interface.md

project_roadmap.md


###############################################################################
TEST DOCUMENTS
###############################################################################

Future Documents

regression_test_rev1.md

decoder_test_log.md

hardware_checkout.md


###############################################################################
PROJECT RULES
###############################################################################

1.
Never modify known-good code without Git.

2.
Commit often.

3.
Push to GitHub often.

4.
Build before every commit.

5.
Regression test after every hardware change.

6.
Update documentation every time the design changes.

7.
One feature at a time.

8.
Keep code readable.

9.
Follow the NASA 10 Rules.

10.
Leave the project better documented than you found it.


###############################################################################
CURRENT PROJECT STATUS
###############################################################################

Current Stable Branch

    main

Current Development Branch

    br-v2-port

Current Project Status

    Known Good Decoder

Current Development Phase

    BR2 Expansion


###############################################################################
END OF DOCUMENT
###############################################################################

