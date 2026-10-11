# NeuralCore

A hardware-accelerator lab: begin with a small, synthesizable multiply-accumulate processing element and a self-checking testbench, then build toward a tiled systolic array and measurable hardware trade-offs.

## First milestone

A signed 8-bit input, signed 8-bit weight, signed 32-bit accumulator MAC. The starter testbench checks reset and a few known arithmetic cases. It is intentionally a simple PE, not yet a complete systolic array.

## Run a simulation

Install Icarus Verilog (`iverilog` and `vvp`) and run:

```bash
iverilog -g2012 -o build/mac_tb.vvp rtl/mac_pe.sv tb/mac_pe_tb.sv
vvp build/mac_tb.vvp
```

## Layout

- `rtl/mac_pe.sv`: synthesizable MAC processing element.
- `tb/mac_pe_tb.sv`: self-checking testbench.
- `docs/`: architecture notes and future measurements.

## Next milestones

- [ ] Add valid/ready handshaking and pipeline registers.
- [ ] Connect PEs into a parameterized systolic array.
- [ ] Verify with randomized tests and reference-model comparisons.
- [ ] Synthesize and report area/timing under a documented tool flow.
- [ ] Compare dataflow, precision, and array dimensions.

A passing simulation does not prove timing closure, physical feasibility, or PPA quality. Record the tool version and constraints for every hardware result.
