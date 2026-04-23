# CPE1510 - Computer Architecture and Assembly Language
## Overview

This repository contains my work from the **CPE1510 - Computer Architecture and Assembly Language** class by Dr. Russ Meier at the Milwaukee School of Engineering. 
The course focuses on computer architecture fundamentals, including processor design, instruction set architecture, assembly language programming, and hardware description using VHDL.

## Learning Objectives

The following course objectives were provided by the course syllabus:
- Use the VHDL hardware description language to implement and simulate a digital system.
- Understand the parameters that determine CPU performance (clock cycle time, CPI, instruction count).
- Explain how the CPU implementation and the instruction set influence the performance parameters.
- Implement a general-purpose register RISC CPU with instructions such as load-word, store-word, beq,
addi, jump, etc.
- Understand the concepts of pipelining such as hazard detection, data forwarding, and branch handling.

## Repository Structure

The files in this repository are organized into the following categories:

```shell
├── assembly/              # Assembly language programs and reference materials
├── cpe1510_lab1/          # Lab 1: Assembly Language Programming
├── cpe1510_lab2/          # Lab 2: VHDL CPU Component Design
├── scp/                   # SCP (Simple CPU Processor) project implementation
└── goetsch-leigh-scp_10/  # Final SCP project iteration
```

### Labs

| Lab   | Description                                                 | Path            |
|-------|-------------------------------------------------------------|-----------------|
| Lab 1 | ARM Assembly Language Programming                           | `cpe1510_lab1/` |
| Lab 2 | VHDL CPU Component Design (ALU, Registers, Memory, Control) | `cpe1510_lab2/` |

### Programming Assignments

| Assignment        | Description                                                             | Path                    |
|-------------------|-------------------------------------------------------------------------|-------------------------|
| Assembly Programs | Various ARM assembly programs (calculator, stack, counter, LED display) | `assembly/`             |
| SCP Project       | Simple CPU Processor VHDL implementation with full pipeline             | `scp/`                  |
| SCP v10           | Refined SCP project with address decoder and register expansions        | `goetsch-leigh-scp_10/` |

## Tools and Technologies

- **Languages**: ARM Assembly, VHDL
- **Tools**: Intel Quartus Prime (FPGA design and simulation)

## Academic Honesty

This repository is published to showcase my work and document my learning progress throughout the course. If you are a student in the same course, please be aware of your academic institution's policies on academic honesty and integrity. **Do not copy any part of these assignments for your own submission.**