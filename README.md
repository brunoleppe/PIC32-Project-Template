# PIC32-Project-Template
A PIC32 project template for working outside MPLAB X

This project uses a custom Makefile to build .elf, .hex and .a files with xc32 compiler.
Tested under Windows 10, 11 and Ubuntu 20.04.

You can work in any text/code editor you want. 
## Issues
When working on VS Code, Intellisense isn't going to work correctly on your project if you modify c_cpp_properties.json to include the microchip files (xc.h and so on), nor setting the compiler path to xc32-gcc. Do not modify c_cpp_properties.json.

When working on Atom, ccls is needed to parse c/c++ files. There are some tutorials for setting ccls in atom.

Currently, there's no support for c++ source files, but modifying the compiler path should be enough.


**WARNING** this project looses all compatibility with MPLAB X projects

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
All source and header files must be placed inside **src** directory. The **build** directory and subdirectories are created at build.

## Configuring the Makefile
You must configure **makefile_defs.mk** to build the project correctly.
  1. Project name: set the **PROJNAME** variable, output files will be assigned this name.
  2. Compiler path: set **CC_PATH** to the compiler path in your system:
      * Ubuntu: /opt/microchip/xc32
      * Windows: C:/Program Files/Microchip/xc32
  3. Compiler Version: set **XC32_VER** to your compiler version: x.yz
  4. Target Processor: set **PROCESSOR** to your target processor. Example: 32MZ1024EFM100, without PIC in the name.
  5. **DEBUGGER**: set to target your debugger only when building for debug.
  6. Optional variables:
      * **OPTIMIZE**: set compiler optimizations. If you don't own a license, valid optimization values are -O, -O1.
      * **USE_LEGACY**: set to TRUE or FALSE to use -legacy-libc.
      * **OUTPUT_DIR**: set a directory to place output files: .elf and .hex when building target, or .a files when building library.
      * **LIBRARIES**: specifies the directories of libraries used in your projects. Makefile will get every .a file inside the specified directories as object files for compilation.
      * **INCLUDEDIR**: specifies the directories of external header files.
      * **UFLAGS**: set this variable with user definitions and extra compiler flags.
## Makefile targets
### default, all
Builds a .hex file from a binary .elf file. 
### library
Builds a library .a file
### debug
Builds a .hex file from a binary .elf file for debugging. Output file is named $(PROJNAME).debug.hex.
### clean
Removes build directory
### print-%
Outputs a Makefile variable value for Makefile debugging purposes.

If **OUTPUT_DIR** is not defined, output files are placed inside **build** directory.
