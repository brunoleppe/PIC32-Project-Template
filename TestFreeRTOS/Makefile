include makefile_defs.mk compiler.mk

DXPRJ = -DXPRJ_default=default

#Output
ifdef OUTPUT_DIR
T_NAME 		= $(OUTPUT_DIR)/$(PROJNAME)
else 
T_NAME		= $(BUILDDIR)/$(PROJNAME)
endif

TARGET 			= $(T_NAME).elf
DEBUG_TARGET 	= $(T_NAME).debug.elf
LIB_TARGET 		= $(T_NAME).a



#C source directories
SOURCEDIRS 	:= ${shell find ${SOURCEDIR} -type d -print}
TARGETDIRS 	:= ${foreach dir,${SOURCEDIRS},${subst $(SOURCEDIR),$(OBJDIR),$(dir)}}
INCLUDES   	:= $(foreach dir,$(SOURCEDIRS),$(addprefix -I, $(dir)))
INCLUDES 	+= $(foreach dir,$(INCLUDEDIR),$(addprefix -I, $(dir)))
SOURCES 	:= $(shell find $(SOURCEDIR) -name '*.c')
OBJECTS 	:= $(subst $(SOURCEDIR),$(OBJDIR),$(SOURCES:.c=.o))

#ASM source directories
ASOURCES 	:= $(shell find $(SOURCEDIR) -name '*.S')
AOBJECTS   	:= $(subst $(SOURCEDIR),$(OBJDIR),$(ASOURCES:.S=.o))

#Library objects
LIBOBJECTS  := $(shell find $(LIBRARIES) -name '*.a')

VPATH        = $(SOURCEDIRS)

#Dependencies
DEPS = $(OBJECTS:.o=.d) $(AOBJECTS:.o=.d)


RM = rm -rf 
RMDIR = rm -rf 
MKDIR = mkdir -p
ERRIGNORE = 2>/dev/null
SEP=/

# Remove space after separator
PSEP = $(strip $(SEP))

ifeq ($(USE_LEGACY),TRUE)
	LIBC = -legacy-libc
else
	LIBC = -no-legacy-libc
endif

DEBUG = FALSE

#Generate rules for C sources, taken from MPLABX command line
define generateRules
$(1)/%.o: %.c
	@echo Building $$@
	@$(CC) -c $$(CFLAGS) $(INCLUDES) $$< -o $$@ $(DXPRJ) $(LIBC)
endef

#Generate rules for ASM .S sources, taken from MPLABX command line
define generateRulesASM
$(1)/%.o: %.S
	@echo Building ASM $$@
	@$(CC) -c $(MPROCESSOR) $(INCLUDES) -MMD -o $$@ $$<  $(DXPRJ) $(LIBC) -Wa,--defsym=__MPLAB_BUILD=1,$$(AFLAGS)-MD=$(addsuffix .asm.d,$$@),--gdwarf-2,$(INCLUDES)
endef

.PHONY: $(TARGET) all clean directories debug debug_build library

all: directories $(TARGET)

debug: directories debug_build

library: directories $(OBJECTS) $(AOBJECTS)
	@$(AR) r $(LIB_TARGET) $(OBJECTS) $(AOBJECTS)
	@echo Building Library done!

debug_build: CFLAGS += $(DFLAGS) 
debug_build: AFLAGS = $(ASM_DFLAGS),
debug_build: LFLAGS = $(LINK_DFLAGS)
debug_build: $(OBJECTS) $(AOBJECTS)
	$(CC) $(DFLAGS) $(MPROCESSOR) $(OBJECTS) $(AOBJECTS) $(LIBOBJECTS) -o $(DEBUG_TARGET) $(DXPRJ) $(LIBC) -Wl,--defsym=__MPLAB_BUILD=1,$(LFLAGS),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map=$(BUILDDIR)/reader.map,--memorysummary,$(BUILDDIR)/memoryfile.xml 
	@echo Building Debug done!

$(TARGET): $(OBJECTS) $(AOBJECTS)
	@$(CC) $(MPROCESSOR) $(OBJECTS) $(AOBJECTS) $(LIBOBJECTS) -o $(TARGET) $(DXPRJ) $(LIBC) -Wl,--defsym=__MPLAB_BUILD=1,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map=$(BUILDDIR)/reader.map,--memorysummary,$(BUILDDIR)/memoryfile.xml 
	@$(HEX) $(TARGET) 
	@echo Building done!

# Include dependencies
-include $(DEPS)

# Generate rules
$(foreach targetdir, $(TARGETDIRS), $(eval $(call generateRules, $(targetdir))))
$(foreach targetdir, $(TARGETDIRS), $(eval $(call generateRulesASM, $(targetdir))))

directories: 
	@$(MKDIR) $(subst /,$(PSEP),$(TARGETDIRS)) $(ERRIGNORE)

# Remove all objects, dependencies and executable files generated during the build
clean:
	@$(RMDIR) $(subst /,$(PSEP),$(BUILDDIR))
	@echo Cleaning done ! 
print-%  : ; 
	@echo $* = $($*)
version : ;
	$(CC) -v

