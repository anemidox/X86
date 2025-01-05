# X86

## Assembly x86 Architecture Programming

Assembly language programming for the x86 architecture provides a low-level approach to interfacing directly with a computer's hardware. It is a critical skill for systems programming, performance optimization, and understanding the inner workings of computing systems. 

This document outlines the basics and core components required to start programming in x86 assembly.

---

### Getting Started
1. **Prerequisites**:
   - Basic understanding of computer architecture (registers, memory, CPU operations).
   - Familiarity with hexadecimal and binary number systems.

2. **Tools Required**:
   - **Assembler**: `NASM` (Netwide Assembler) is highly recommended.
   - **Debugger**: `GDB` (GNU Debugger) or `edb-debugger`.
   - **Text Editor**: Any editor, such as `VS Code` or `Vim`, supporting syntax highlighting for assembly.

3. **System Requirements**:
   - A machine capable of running 32-bit or 64-bit x86 instructions.
   - For Linux systems, GCC can be used to link assembly programs.

---

### Basic Concepts

#### 1. Registers
- **General-Purpose Registers**:
  - `EAX`, `EBX`, `ECX`, `EDX` (32-bit)
  - `AX`, `BX`, `CX`, `DX` (16-bit)
  - `AL`, `BL`, `CL`, `DL` (8-bit)

- **Special-Purpose Registers**:
  - `ESP` (Stack Pointer), `EBP` (Base Pointer)
  - `EIP` (Instruction Pointer)
  - `FLAGS` (Status Flags)

#### 2. Memory Addressing
- Modes:
  - Immediate: `MOV EAX, 10`
  - Register: `MOV EAX, EBX`
  - Direct: `MOV EAX, [1234H]`
  - Indexed: `MOV EAX, [EBX+4]`

#### 3. Basic Instructions
- Data Movement: `MOV`, `PUSH`, `POP`
- Arithmetic: `ADD`, `SUB`, `MUL`, `DIV`
- Logic: `AND`, `OR`, `XOR`, `NOT`
- Control Flow: `JMP`, `CALL`, `RET`, `CMP`, `JE`, `JNE`

---

### Example Program

This example demonstrates a simple program that adds two numbers:

```asm
section .data
    num1 db 10
    num2 db 20
    result db 0

section .text
    global _start

_start:
    mov al, [num1]   ; Load num1 into AL
    add al, [num2]   ; Add num2 to AL
    mov [result], al ; Store the result

    mov eax, 1       ; System call to exit
    int 0x80         ; Interrupt to invoke the system call
```

---

### Resources
- **Books**:
  - "Programming from the Ground Up" by Jonathan Bartlett
  - "Modern X86 Assembly Language Programming" by Daniel Kusswurm

- **Websites**:
  - [x86 Assembly Guide](https://www.cs.virginia.edu/~evans/cs216/guides/x86.html)
  - [NASM Documentation](https://www.nasm.us/doc/)

- **Tools**:
  - [NASM](https://www.nasm.us/)
  - [GDB Debugger](https://www.gnu.org/software/gdb/)

---

### Learning Tips
1. Start with simple programs and gradually introduce complexity.
2. Use comments extensively to explain each line of code.
3. Experiment with different memory addressing modes.
4. Debug frequently to understand how the CPU executes instructions.
5. Practice optimizing code for performance.
