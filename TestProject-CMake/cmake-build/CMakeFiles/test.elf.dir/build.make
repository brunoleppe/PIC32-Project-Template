# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build

# Include any dependencies generated for this target.
include CMakeFiles/test.elf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test.elf.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test.elf.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test.elf.dir/flags.make

CMakeFiles/test.elf.dir/delay.c.o: CMakeFiles/test.elf.dir/flags.make
CMakeFiles/test.elf.dir/delay.c.o: /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/delay.c
CMakeFiles/test.elf.dir/delay.c.o: CMakeFiles/test.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/test.elf.dir/delay.c.o"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test.elf.dir/delay.c.o -MF CMakeFiles/test.elf.dir/delay.c.o.d -o CMakeFiles/test.elf.dir/delay.c.o -c /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/delay.c

CMakeFiles/test.elf.dir/delay.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test.elf.dir/delay.c.i"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/delay.c > CMakeFiles/test.elf.dir/delay.c.i

CMakeFiles/test.elf.dir/delay.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test.elf.dir/delay.c.s"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/delay.c -o CMakeFiles/test.elf.dir/delay.c.s

CMakeFiles/test.elf.dir/initialization.c.o: CMakeFiles/test.elf.dir/flags.make
CMakeFiles/test.elf.dir/initialization.c.o: /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/initialization.c
CMakeFiles/test.elf.dir/initialization.c.o: CMakeFiles/test.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/test.elf.dir/initialization.c.o"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test.elf.dir/initialization.c.o -MF CMakeFiles/test.elf.dir/initialization.c.o.d -o CMakeFiles/test.elf.dir/initialization.c.o -c /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/initialization.c

CMakeFiles/test.elf.dir/initialization.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test.elf.dir/initialization.c.i"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/initialization.c > CMakeFiles/test.elf.dir/initialization.c.i

CMakeFiles/test.elf.dir/initialization.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test.elf.dir/initialization.c.s"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/initialization.c -o CMakeFiles/test.elf.dir/initialization.c.s

CMakeFiles/test.elf.dir/main.c.o: CMakeFiles/test.elf.dir/flags.make
CMakeFiles/test.elf.dir/main.c.o: /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/main.c
CMakeFiles/test.elf.dir/main.c.o: CMakeFiles/test.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/test.elf.dir/main.c.o"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test.elf.dir/main.c.o -MF CMakeFiles/test.elf.dir/main.c.o.d -o CMakeFiles/test.elf.dir/main.c.o -c /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/main.c

CMakeFiles/test.elf.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test.elf.dir/main.c.i"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/main.c > CMakeFiles/test.elf.dir/main.c.i

CMakeFiles/test.elf.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test.elf.dir/main.c.s"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/main.c -o CMakeFiles/test.elf.dir/main.c.s

CMakeFiles/test.elf.dir/ex1.S.o: CMakeFiles/test.elf.dir/flags.make
CMakeFiles/test.elf.dir/ex1.S.o: /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/ex1.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building ASM object CMakeFiles/test.elf.dir/ex1.S.o"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/test.elf.dir/ex1.S.o -c /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/ex1.S

CMakeFiles/test.elf.dir/ex1.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing ASM source to CMakeFiles/test.elf.dir/ex1.S.i"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/ex1.S > CMakeFiles/test.elf.dir/ex1.S.i

CMakeFiles/test.elf.dir/ex1.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling ASM source to assembly CMakeFiles/test.elf.dir/ex1.S.s"
	/opt/microchip/xc32/v4.21/bin/xc32-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src/ex1.S -o CMakeFiles/test.elf.dir/ex1.S.s

# Object files for target test.elf
test_elf_OBJECTS = \
"CMakeFiles/test.elf.dir/delay.c.o" \
"CMakeFiles/test.elf.dir/initialization.c.o" \
"CMakeFiles/test.elf.dir/main.c.o" \
"CMakeFiles/test.elf.dir/ex1.S.o"

# External object files for target test.elf
test_elf_EXTERNAL_OBJECTS =

test.elf: CMakeFiles/test.elf.dir/delay.c.o
test.elf: CMakeFiles/test.elf.dir/initialization.c.o
test.elf: CMakeFiles/test.elf.dir/main.c.o
test.elf: CMakeFiles/test.elf.dir/ex1.S.o
test.elf: CMakeFiles/test.elf.dir/build.make
test.elf: CMakeFiles/test.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C executable test.elf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test.elf.dir/build: test.elf
.PHONY : CMakeFiles/test.elf.dir/build

CMakeFiles/test.elf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test.elf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test.elf.dir/clean

CMakeFiles/test.elf.dir/depend:
	cd /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/src /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build /home/bleppe/Documents/Github/PIC32-Project-Template/TestProject/cmake-build/CMakeFiles/test.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test.elf.dir/depend

