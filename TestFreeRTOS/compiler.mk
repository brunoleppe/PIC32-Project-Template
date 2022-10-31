#compiler
CC 			= $(CC_PATH)/v$(XC32_VER)/bin/xc32-gcc
CPP			= $(CC_PATH)/v$(XC32_VER)/bin/xc32-g++
#Binary to HEX
HEX 		= $(CC_PATH)/v$(XC32_VER)/bin/xc32-bin2hex
#Librarian
AR 			= $(CC_PATH)/v$(XC32_VER)/bin/xc32-ar

MPROCESSOR 	= -mprocessor=$(PROCESSOR)

#Compiler Flags used by MPLABX
CFLAGS 		= -Wall -x c $(MPROCESSOR) $(OPTIMIZE) $(UFLAGS) -MMD

DFLAGS 		= -g -D__DEBUG -D__MPLAB_DEBUGGER_$(DEBUGGER)=1 -fframe-base-loclist
ASM_DFLAGS	= --defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_$(DEBUGGER)=1
LINK_DFLAGS = --defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_$(DEBUGGER)=1

