# Dr_Quine - Kleene's Recursion Theorem

## Overview

**Dr_Quine** is a project that explores the concept of **quine** (metaprogram) and introduces you to the principles of recursion and self-reproduction in programming. The goal is to create programs that produce their own source code as output.

### What is a Quine?

A quine is a computer program whose output and source code are **identical**. It is a fundamental concept in theoretical computer science and a perfect introduction to more complex projects, particularly those related to malware.

**Note**: Simply reading the source file and displaying it is considered cheating. User input (argv/argc) is also forbidden.

---

## Objectives

- Understand and master the concept of **quine**
- Implement solutions in **C** and **Assembly** (x86-64)
- Grasp the principles of **code self-reproduction**
- Discover **fixed points** in theoretical computer science
- Handle errors properly (no segmentation faults, double free, etc.)

---

## Project Structure

```
dr_quine/
├── README.md
├── C/
│   ├── Colleen/
│   │   ├── Colleen.c
│   │   └── Makefile
│   ├── Grace/
│   │   ├── Grace.c
│   │   └── Makefile
│   └── Sully/
│       ├── Sully.c
│       └── Makefile
└── Assembly/
    ├── Colleen/
    │   └── Colleen.s
    ├── Grace/
    │   └── Grace.s
    └── Sully/
        └── Sully.s
```

---

## Programs Description

### 1. Colleen - Simple Display

**Goal**: The program simply displays its own source code to stdout.

#### C Specifications
- Must contain a `main` function
- Must contain **at least 2 different comments**
- One comment **inside** the main function
- One comment **outside** the main function
- One additional function (which will be called)

#### Assembly Specifications
- Clear entry point (`_start` or symbol linked to `main`)
- **At least 2 comments**
- One comment inside or near the entry point
- One comment outside the entry point routine
- One additional routine/function called from the entry point

#### Usage Example
```bash
$ cd C/Colleen && clang -Wall -Wextra -Werror -o Colleen Colleen.c
$ ./Colleen > tmp_Colleen && diff tmp_Colleen Colleen.c
$ # No difference - output is identical to source!

$ cd ../../Assembly/Colleen
$ nasm -f elf64 Colleen.s -o Colleen.o && gcc Colleen.o -o Colleen
$ ./Colleen > tmp_Colleen && diff tmp_Colleen Colleen.s
$ # Success!
```

#### Action Plan for Colleen.c
1. Create the source code with a main function and a helper function
2. In the helper function, define the entire source code as a string
3. Use printf() to output the string
4. The string must include itself (self-reference)
5. Compile and test: output must be identical to source

#### Action Plan for Colleen.s
1. Write the source code as a data section (string)
2. Create a helper routine to write the string to stdout
3. Use syscall write (syscall 1) to output data
4. Return to main and exit (syscall 60)
5. Assemble and link, then test

---

### 2. Grace - File Generation

**Goal**: The program creates a file `Grace_kid.c` or `Grace_kid.s` containing a copy of its own source code.

#### C Specifications
- **NO main function declared** (no functions at all)
- **Exactly 3 `#define`**
- **Exactly 1 comment**
- The program runs by **calling a macro**

#### Assembly Specifications
- **No additional routines** beyond the entry point
- **Exactly 3 macros** (or closest equivalent)
- **Exactly 1 comment**

#### Usage Example
```bash
$ cd C/Grace && clang -Wall -Wextra -Werror -o Grace Grace.c
$ ./Grace
$ ls -la | grep Grace_kid
# Grace_kid.c file created with identical content to Grace.c

$ diff Grace.c Grace_kid.c
$ # No difference!

$ cd ../../Assembly/Grace
$ nasm -f elf64 Grace.s -o Grace.o && gcc Grace.o -o Grace
$ rm -f Grace_kid.s && ./Grace
$ diff Grace_kid.s Grace.s
$ # Identical!
```

#### Action Plan for Grace.c
1. Define a macro that contains the entire source code as a string
2. Create a second macro that handles file operations (open, write, close)
3. Create a third macro that orchestrates the entire process
4. The entry point is the call to the main macro (via FT(xxx))
5. Open file "Grace_kid.c" for writing
6. Write the entire source code to the file
7. Close the file
8. Program terminates

#### Action Plan for Grace.s
1. Define macro 1: Contains the raw source code as a string
2. Define macro 2: Handles the file write logic (using syscalls)
3. Define macro 3: Orchestrates open, write, and close operations
4. Entry point: Call macro 3
5. Use syscall 2 (open) to create "Grace_kid.s"
6. Use syscall 1 (write) to output source code
7. Use syscall 3 (close) to close the file
8. Exit via syscall 60

---

### 3. Sully - Recursive Generation

**Goal**: The program creates a file `Sully_X.c` or `Sully_X.s`, compiles and executes it. The integer `X` decrements with each generation until reaching 0.

#### Specifications
- Creates files named `Sully_X.c` / `Sully_X.s` (X is an integer)
- Initial integer value is **5**
- With each execution, **X decrements by 1**
- Program stops when **X < 0**
- Each generated file is compiled and executed automatically

#### Usage Example
```bash
$ cd C && clang -Wall -Wextra -Werror Sully/Sully.c -o Sully
$ ./Sully
$ ls -la | grep Sully | wc -l
# 13 files created (Sully_5.c, Sully_4.c, ..., Sully_0.c + executables)

$ diff Sully/Sully.c Sully_0.c
# Only difference is the integer value

$ # Check decrement
$ diff Sully_3.c Sully_2.c
# int i = 3; → int i = 2;
```

#### Action Plan for Sully.c
1. Define an integer `i` initialized to 5
2. Define the entire source code as a string that includes the current value of `i`
3. Build the child filename: sprintf("Sully_%d.c", i-1)
4. Open the child file for writing
5. Write the entire source code to the file, but with `i-1` instead of `i`
6. Close the file
7. Execute: system("clang -Wall -Wextra -Werror -o Sully_X Sully_X.c")
8. Execute: system("./Sully_X")  ← **Only if i-1 >= 0**
9. Program terminates

#### Action Plan for Sully.s
1. Define an integer value `i` initialized to 5 (in data section)
2. Define the entire source code as a string in the data section
3. Main routine:
   - Load current value of `i`
   - Build filename "Sully_X.s" where X = i-1
   - Open file for writing (syscall 2)
   - Write source code to file (syscall 1) with decremented value
   - Close file (syscall 3)
4. Compile child:
   - Use system("nasm -f elf64 Sully_X.s -o Sully_X.o")
   - Use system("gcc Sully_X.o -o Sully_X")
5. Execute child: system("./Sully_X")  ← **Only if i-1 >= 0**
6. Exit via syscall 60

---

## Compilation and Execution

### C Part

```bash
# Compilation
$ cd C/Colleen && clang -Wall -Wextra -Werror -o Colleen Colleen.c
$ cd ../Grace && clang -Wall -Wextra -Werror -o Grace Grace.c
$ cd ../Sully && clang -Wall -Wextra -Werror -o Sully Sully.c

# Execution
$ ./Colleen
$ ./Grace
$ ./Sully
```

### Assembly Part

```bash
# Compilation and linking (NASM x86-64)
$ cd Assembly/Colleen
$ nasm -f elf64 Colleen.s -o Colleen.o && gcc Colleen.o -o Colleen

$ cd ../Grace
$ nasm -f elf64 Grace.s -o Grace.o && gcc Grace.o -o Grace

$ cd ../Sully
$ nasm -f elf64 Sully.s -o Sully.o && gcc Sully.o -o Sully

# Execution
$ ./Colleen
$ ./Grace
$ ./Sully
```

---

## Techniques Used

### Quines in C
- Use of **string literals** with escape characters
- `#define` macros for code generation
- **String indirection** techniques
- Recursive string definitions

### Quines in Assembly
- Use of **syscalls** (write, open, close, read, etc.)
- Manipulation of the **x86-64 stack**
- **Data pointers** and **code pointers**
- Assembler macros to minimize code size

### Recursive Generation (Sully)
- Process creation and execution
- Dynamic compilation
- Execution of generated programs
- Integer decrement logic

---

## Theoretical Concepts

This project illustrates several important concepts:

1. **Kleene's Recursion Theorem**: Any universal computing system can have self-referential programs
2. **Fixed Points**: A quine is a fixed point of the compilation/execution process
3. **Metaprogramming**: Writing code that manipulates code
4. **Self-Reproduction**: The foundation of computer viruses and malware

---

## Important Rules

ALLOWED:
- Use advanced and creative quine techniques
- Complex macro usage
- File manipulation in C
- Direct syscalls in Assembly

FORBIDDEN:
- Simply reading the source file and displaying it
- Use of argv or argc
- Segmentation faults, bus errors, double free
- Trivial approach (empty source)

---