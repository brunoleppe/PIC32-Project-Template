# PIC32-Project-Template
A PIC32 project template for working outside MPLAB X

This project uses a custom Makefile to build .elf, .hex and .a files with xc32 compiler.
Tested under Windows 10,11 and Ubuntu 20.04

## Project Directory Structure
The project structure consists of two subdirectories: **src** and **build**:
```
project
│   Makefile
│   makefile_defs.mk
│   compiler.mk
|
└───src
│   │   file1.c
│   │   file2.h
│   │   ...
|   |   
│   └───subsrc1
│       │   file11.c
│       │   file12.h
│       │   ...
│   └───subsrc2
│       │   file21.c
│       │   file22.h
│       │   ...
│  
└───build
    │   ...
```
All source and header files must be placed inside **src**.
**build** directory and subdirectories are created at build.

## Configuring the Makefile
You must configure **makefile_defs.mk** to build the project correctly.
  1. Project name: set the PROJNAME variable, output files will be assigned this name ($(PROJNAME).hex).
  2. Compiler path: set CC_PATH to the compiler path in your system:
      * Ubuntu: /opt/microchip/xc32
      * Windows: C:/Program Files/Microchip/xc32
  3. Compiler Version: set XC32_VER to your compiler version: x.yz
  4. Target Processor: set PROCESSOR to your target processor. EXAMPLE: 32MZ1024EFM100, without PIC in the name.
  5. DEBUGGER: set to target your debugger only when building for debug.
  6. Optional variables:
      * OPTIMIZE: set compiler optimizations. If you don't own a license, valid optimization values are -O, -O1.
      * USE_LEGACY: set to TRUE or FALSE to use -legacy-libc.
      * OUTPUT_DIR: set a directory to place output files: .elf and .hex when building target, or .a files when building library.
      * LIBRARIES: specifies the directories of libraries used in your projects. Makefile will get every .a file inside the specified directories as object files for compilation.
      * INCLUDEDIR: specifies the directories of external header files.
      * UFLAGS: set this variable with user definitions and extra compiler flags.
## Makefile targets
### default, all
Builds a .hex file from a binary .elf file. 
### library
Builds a library .a file
### debug