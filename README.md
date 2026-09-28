
## Contents
- [Half Adder](#half-adder)
- [Full Adder](#full-adder)

## Repository Structure
```
Verilog-designs/
├── half_adder/
│   ├── Halfadder.v
│   ├── Halfadder_sim.v

├── full_adder/
│   ├── full_adder.v
│   ├── Halfadder.v
│   ├── fullsim.v
└── README.md

## Half Adder
### Description
A half adder adds two 1-bit binary inputs and produces a **sum** and a **carry**. It is the simplest arithmetic circuit in digital design and the building block of the full adder.

### Truth Table
| A | B | Sum | Carry |
|---|---|-----|-------|
| 0 | 0 |  0  |   0   |
| 0 | 1 |  1  |   0   |
| 1 | 0 |  1  |   0   |
| 1 | 1 |  0  |   1   |

### Logic Used
- `sum = a ^ b` (XOR): the sum bit is 1 only when the inputs differ.
- `carry = a & b` (AND): a carry is generated only when both inputs are 1.

The circuit uses one XOR gate and one AND gate.


## Full Adder
### Description
A full adder adds three 1-bit inputs (**a**, **b** and carry-in **cin**) and produces a **sum** and a **carry** output. Unlike the half adder, it accepts a carry from a previous stage, so multiple full adders can be chained to add multi-bit numbers.

### Truth Table
| a | b | cin | sum | carry |
|---|---|-----|-----|-------|
| 0 | 0 |  0  |  0  |   0   |
| 0 | 0 |  1  |  1  |   0   |
| 0 | 1 |  0  |  1  |   0   |
| 0 | 1 |  1  |  0  |   1   |
| 1 | 0 |  0  |  1  |   0   |
| 1 | 0 |  1  |  0  |   1   |
| 1 | 1 |  0  |  0  |   1   |
| 1 | 1 |  1  |  1  |   1   |

### Logic Used
The design is **structural**: it is built from two half adders and one OR gate.

1. **HA1** adds `a` and `b`, giving `s1 = a ^ b` and `c1 = a & b`.
2. **HA2** adds `s1` and `cin`, giving the final `sum = s1 ^ cin` and `c2 = s1 & cin`.
3. An **OR gate** combines the two carries: `carry = c1 | c2`.

Resulting equations:
- `sum = a ^ b ^ cin`
- `carry = (a & b) | (cin & (a ^ b))`


## What I Learnt
- How binary addition maps onto basic logic gates (XOR for sum, AND for carry).
- Writing combinational modules in Verilog using `assign` statements.
- Hierarchical (structural) design: instantiating one module inside another and connecting ports with internal wires.
- Reusing verified modules instead of rewriting logic.
- Why a carry-in matters: full adders can be cascaded to form a ripple-carry adder for multi-bit addition.
- Exhaustive testing: an n-input combinational circuit needs 2^n test vectors (4 for the half adder, 8 for the full adder).
- Reading behavioral simulation waveforms and managing multiple source files and top modules in Vivado.

## Tools
Xilinx Vivado
