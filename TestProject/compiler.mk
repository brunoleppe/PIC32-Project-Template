#compiler
CC 			= xc32-gcc
CPP			= xc32-g++
#Binary to HEX
HEX 		= xc32-bin2hex
#Librarian
AR 			= xc32-ar

MPROCESSOR 	= -mprocessor=$(PROCESSOR)

#Compiler Flags used by MPLABX
CFLAGS 		= -Wall -x c $(MPROCESSOR) $(OPTIMIZE) $(UFLAGS) -MMD

DFLAGS 		= -g -D__DEBUG -D__MPLAB_DEBUGGER_$(DEBUGGER)=1 -fframe-base-loclist
ASM_DFLAGS	= --defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_$(DEBUGGER)=1
LINK_DFLAGS = --defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_$(DEBUGGER)=1
HEAP        = 4096
