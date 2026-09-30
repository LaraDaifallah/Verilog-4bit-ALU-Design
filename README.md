# Verilog 4-bit ALU Design

A modular **4-bit arithmetic logic unit (ALU)** implemented in Verilog, with behavioral and dataflow selection logic, gate-level building blocks, Quartus schematics, and saved simulation waveforms.

## Supported operations

| Opcode | Operation | Result |
| --- | --- | --- |
| `000` | Subtraction | `a - b` |
| `001` | Addition | `a + b` |
| `010` | Bitwise OR | `a \| b` |
| `011` | Bitwise AND | `a & b` |
| `100`–`111` | Unassigned | `4'bzzzz` (high impedance) |

Inputs `a` and `b` are 4-bit values; `op` is a 3-bit selector. Arithmetic results retain the low four bits. `cout_add` and `cout_sub` expose the arithmetic carry outputs independently of the selected operation. For unsigned subtraction, `cout_sub = 1` indicates no borrow.

## Design

- **Full adder:** XOR, AND, and OR gates implement a one-bit adder.
- **Addition:** four full adders form a ripple-carry adder, with carry-in tied to zero in the ALU.
- **Subtraction:** computes `a + ~b + 1` using the same full-adder structure.
- **Logic operations:** per-bit AND and OR gates.
- **Behavioral ALU:** selects the operation with an `always @(*)` block and `case` statement; the result port is named `Cout`.
- **Dataflow ALU:** selects the operation with a continuous conditional assignment; the result port is named `result`.

## Repository contents

| Files | Purpose |
| --- | --- |
| `alu_behavioral.v`, `alu_dataflow.v` | Two ALU implementations |
| `full_adder.v`, `addition_code.v`, `subtraction_code.v` | Arithmetic modules |
| `bitwise_and.v`, `bitwise_or.v` | Logic modules |
| `*.bdf`, `*.bsf` | Quartus block diagrams and symbol |
| `*.vwf` | Saved Quartus waveform files for modules and ALU variants |
| `*.qpf` | Original Quartus project metadata |
| [Project report](docs/project-report.pdf) | Original coursework report |
| `archive/backups/` | Earlier source versions retained for reference |

Design files remain together at the repository root to preserve their original relative placement.

## Opening and using the design

The supplied project metadata identifies **Quartus II 9.0** and revision `prjjj`. The original archive does **not** include the corresponding `.qsf` settings file, so the `.qpf` alone is not a complete build configuration.

1. Create a Quartus project in a working copy of this directory.
2. Add the seven active `.v` files from the repository root.
3. Choose `alu_behavioral` or `alu_dataflow` as the top-level entity and select a target device suitable for your setup.
4. Before compiling, give each submodule instance a unique instance name: the preserved original sources omit names in the ALU and arithmetic modules. For example, change `bitwise_and (a,b,w_AND);` to `bitwise_and u_and (a,b,w_AND);`.
5. Run analysis and compilation, then open a matching `.vwf` file with a compatible Quartus waveform/simulation tool. Regenerate node assignments if required by the new project.

The `.bdf` files can also be opened to inspect the original schematic implementation. Simulation workflows vary between Quartus versions.

## Archive and validation notes

The uploaded design sources are preserved as supplied. No compilation or new simulation has been performed for this repository; saved waveforms and the report are original project artifacts.

Backup files are historical versions, **not active build inputs**. They include an earlier ALU interface, an earlier default-value expression, an AND module that used OR gates, repeated OR instance names, and an earlier full-adder version. The identical `addition_code.v.bak` and duplicate PDF copy were omitted.

**Author:** Lara Daifallah
