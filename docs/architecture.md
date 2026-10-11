# Architecture notebook

## Baseline MAC PE

- Inputs: signed 8-bit activation `a`, signed 8-bit weight `w`.
- State: signed 32-bit accumulator `acc`.
- Behavior: on an enabled rising edge, `acc <- acc + a*w`; active-low reset clears the accumulator.
- Current limitation: no input/output forwarding, valid/ready protocol, saturation policy, or overflow detection.

## Measurements to add

Record synthesis tool/version, target library/FPGA, clock constraint, area metric, timing metric, and test coverage. Keep functional verification separate from synthesis and physical-design claims.
