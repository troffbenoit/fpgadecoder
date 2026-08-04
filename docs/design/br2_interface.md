###############################################################################
#
#                  FPGA 6502 ADDRESS DECODER PROJECT
#
#                         BR2 INTERFACE NOTES
#
# Revision : 1.0
# Branch   : br-v2-port
#
###############################################################################

PURPOSE
=======

This document records the BR2 interface work that has been physically tested.

The goal is simple:

    Make sure the FPGA can drive known signals out through the BR2 connector
    before we route any real address-decoder signals there.

Think of BR2 as a doorway.

Before sending important signals through the doorway, we first send a simple
1 kHz square wave through it so we can prove the path works.


###############################################################################
CURRENT VERIFIED BR2 SIGNALS
###############################################################################

Signal Name
-----------

br2_test

FPGA Pin
--------

B41

Direction
---------

FPGA OUTPUT

Current Function
----------------

1 kHz square-wave diagnostic output.

Purpose
-------

Used with an oscilloscope to verify that the FPGA signal is physically
reaching the expected BR2 connection.


-------------------------------------------------------------------------------

Signal Name
-----------

br2_probe2

FPGA Pin
--------

B42

Direction
---------

FPGA OUTPUT

Current Function
----------------

1 kHz square-wave diagnostic output.

Purpose
-------

Second oscilloscope test point.

It currently carries the exact same waveform as br2_test.

This lets us verify two BR2 routes at the same time.


###############################################################################
CONSTRAINT FILE MAPPING
###############################################################################

The following assignments are present in:

    constraint/alchitry.acf

Verified assignments:

    pin br2_test   B41
    pin br2_probe2 B42


This means:

    br2_test   leaves the FPGA through physical FPGA pin B41.

    br2_probe2 leaves the FPGA through physical FPGA pin B42.


###############################################################################
TOP-LEVEL LUCID SIGNALS
###############################################################################

The current top-level module declares:

    output br2_test
    output br2_probe2


Both outputs are driven from the same registered square-wave signal:

    br2_test   = br2_square.q
    br2_probe2 = br2_square.q


This is intentional.

At this stage we are testing physical routing, not independent signal logic.


###############################################################################
1 kHz SQUARE-WAVE GENERATOR
###############################################################################

The FPGA clock is:

    100 MHz


That means the FPGA receives:

    100,000,000 clock cycles every second.


The BR2 diagnostic counter counts from:

    0

through:

    49,999


That is:

    50,000 FPGA clock cycles.


At 100 MHz:

    50,000 clock cycles = 500 microseconds


Every 500 microseconds the signal changes state:

    LOW  -> HIGH

or

    HIGH -> LOW


A complete square-wave cycle requires two state changes:

    LOW -> HIGH -> LOW


Therefore:

    500 microseconds HIGH
    500 microseconds LOW

Total period:

    1 millisecond


Frequency:

    1 / 0.001 second = 1000 Hz

Therefore:

    BR2 TEST FREQUENCY = 1 kHz


###############################################################################
CURRENT LUCID IMPLEMENTATION
###############################################################################

The diagnostic logic uses two registers:

    br2_counter

and

    br2_square


The counter stores how many 100 MHz FPGA clock cycles have occurred.

The square-wave register stores the current output state.


Simplified operation:

    Start counter at 0.

    Count upward every FPGA clock.

    When counter reaches 49,999:

        Reset counter to 0.

        Toggle br2_square.

    Repeat forever.


The important output assignments are:

    br2_test   = br2_square.q
    br2_probe2 = br2_square.q


###############################################################################
BENCH TEST RESULT
###############################################################################

TEST EQUIPMENT
--------------

Oscilloscope connected to BR2 test points.


TEST CONDITION
--------------

Current known-good FPGA code loaded.

BR2 diagnostic outputs enabled by normal FPGA operation.


EXPECTED RESULT
---------------

B41:

    1 kHz square wave


B42:

    1 kHz square wave


MEASURED RESULT
---------------

B41:

    PASS
    1 kHz square wave observed


B42:

    PASS
    1 kHz square wave observed


OVERALL RESULT
--------------

    PASS


The FPGA can successfully drive both tested BR2 routes.


###############################################################################
WHAT THIS TEST PROVES
###############################################################################

This test proves several things at the same time.

1.

The Lucid top-level output declarations are valid.


2.

The Alchitry constraint file pin assignments are valid.


3.

FPGA pin B41 is physically reachable through the expected BR2 path.


4.

FPGA pin B42 is physically reachable through the expected BR2 path.


5.

The FPGA build process accepts the BR2 assignments.


6.

The FPGA bitstream loads successfully.


7.

The external hardware path can be measured with an oscilloscope.


8.

Two BR2 signals can operate simultaneously.


###############################################################################
WHAT THIS TEST DOES NOT PROVE
###############################################################################

The test does NOT yet prove that:

    Address lines are correctly routed to BR2.

    Chip-select signals are correctly routed to BR2.

    BR2 input signals work.

    Bidirectional BR2 signals work.

    All BR2 pins have been mapped.

    Voltage-level compatibility has been checked for every future signal.


Those items must be tested individually.


###############################################################################
BR2 DEVELOPMENT RULE
###############################################################################

Do not replace both diagnostic outputs at once.

Recommended procedure:

    1. Keep one known-good 1 kHz probe signal.

    2. Replace only one BR2 test signal with a real project signal.

    3. Build.

    4. Load.

    5. Measure.

    6. Regression test the existing decoder.

    7. Commit only after the test passes.


This gives us a known-good reference signal while new BR2 signals are added.


###############################################################################
PLANNED FUTURE BR2 SIGNALS
###############################################################################

Possible future signals include:

    Address decoder outputs

    ROM chip select

    RAM chip select

    UART chip select

    ACIA chip select

    Address bus signals

    Clock or timing signals


No future assignment should be treated as final until it has been:

    documented

    built

    loaded

    measured

    regression tested


###############################################################################
NASA-STYLE ENGINEERING RULES
###############################################################################

1.

Drive every output.


2.

Drive every module input.


3.

Use safe defaults before specific assignments.


4.

Use clear names for active-low signals.


5.

Test one small function at a time.


6.

Never gate the FPGA clock.


7.

Use clear signal names.


8.

Avoid clever code that is hard to debug.


9.

Keep decoder logic combinational where practical.


10.

Preserve known-good behavior while adding new features.


###############################################################################
REVISION HISTORY
###############################################################################

Revision 1.0

    Initial BR2 interface document.

    Recorded FPGA pin B41 as br2_test.

    Recorded FPGA pin B42 as br2_probe2.

    Documented the 100 MHz to 1 kHz divider.

    Recorded successful oscilloscope verification of both outputs.


###############################################################################
END OF DOCUMENT
###############################################################################

