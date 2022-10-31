#Project Name
#Binary file will be named $(PROJNAME).elf and HEX file will be named $(PROJNAME).hex
#Debug file will be named $(PROJNAME).debug.elf
#Library file will be named $(PROJNAME).a
PROJNAME   	= TestFreeRTOS

#Project Directories
PROJDIR 	= $(CURDIR)
SOURCEDIR 	= src
BUILDDIR 	= build
OBJDIR 		= $(BUILDDIR)/obj

#Directory to place output files: 
# 	- .elf and .hex outputs
#	- .debug.elf debug output
#	- .a library output
# 
# If undefined, output files will be placed in $(BUILDIR)
OUTPUT_DIR  = 

#Libraries
#Define this variable with the paths of included libraries
LIBRARIES 	= 
#define this variable with the paths of external header files
INCLUDEDIR 	= 

#Compiler Path and version
#Windows
CC_PATH 	= C:/Program Files/Microchip/xc32
#Linux
#CC_PATH		= /opt/microchip/xc32
XC32_VER 	= 4.10

#Target Processor
PROCESSOR 	= 32MZ1024EFM100
#Optimization
OPTIMIZE   	= -O1
#Use Legacy libc
USE_LEGACY 	= FALSE
#Debugger
DEBUGGER 	= ICD4


#User Compiler Flags
#Example define FREERTOS, USE_HOOKS: 
#UFLAGS = -DFREERTOS -DUSE_HOOKS
UFLAGS 		= 


