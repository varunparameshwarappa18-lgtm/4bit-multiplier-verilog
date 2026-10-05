# 4-bit Shift-and-Add Multiplier: RTL Design and Simulation (Verilog)

A clocked 4-bit multiplier with asynchronous reset, written in Verilog and simulated with Cadence NC-Verilog. Waveforms were viewed in Cadence SimVision.

## Design
`multiplier` takes two 4-bit inputs `A` and `B` and produces an 8-bit product `P`. On each rising clock edge it uses shift-and-add: for every bit `B[i]` that is 1, it adds `A` shifted left by `i` to the running product. An asynchronous reset (`rst`) clears `P` to 0.

## Testbench
`multiplier_tb` generates a clock with a 10 ns period and applies three directed input pairs, with a reset pulse between them:

| A | B | Expected P (decimal) | Expected P (hex) |
|---|---|----------------------|------------------|
| 15 | 15 | 225 | E1 |
| 5  | 5  | 25  | 19 |
| 12 | 2  | 24  | 18 |

The first case (15 x 15) is the maximum-value case for 4-bit operands.

## Result
The SimVision waveform shows `P` taking the expected value after the next rising clock edge for all three cases, and returning to 00 when reset is asserted.

(4bit_multiplier.png)

## Files
- `rtl/multiplier.v`: design (`multiplier`)
- `tb/multiplier_tb.v`: testbench (`multiplier_tb`)
- `4bit_multiplier.png`: SimVision waveform

## Tools
Verilog, Cadence NC-Verilog, Cadence SimVision

## Limitations and next steps
- Stimulus is directed with three cases; zero and one operands are not yet tested.
- Checking is done by inspecting waveforms. A self-checking testbench with expected-value comparison is the next improvement.
- The design uses blocking assignments inside a clocked block, which works in simulation; nonblocking assignments are the usual style for sequential RTL.
