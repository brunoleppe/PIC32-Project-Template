cmake_minimum_required(VERSION 3.24.2)

#Compiler
set(CMAKE_C_COMPILER "/opt/microchip/xc32/v4.21/bin/xc32-gcc")
#Device Family Pack
set(DFP /opt/microchip/mplabx/v6.00/packs/Microchip/PIC32MZ-EF_DFP/1.3.58)

#Device
set(PIC  32MZ1024EFM100)

set(OPTIMIZATION 1)
set(USER_FLAGS -Wall)
set(USER_DEFINITIONS )
set(HEAP 0)


# set(CMAKE_VERBOSE_MAKEFILE True)

set(SOURCES
        main.c
        FreeRTOSConfig.h
        initialization.c initialization.h)

project(Reader C ASM)

# FreeRTOS Directories
include_directories(FreeRTOS/Source/include)
include_directories(FreeRTOS/Source/portable/MPLAB/PIC32MZ)
# FreeRTOSConfig.h is located here
include_directories(.)

add_subdirectory(FreeRTOS)

add_executable(${PROJECT_NAME}.elf ${SOURCES})
target_link_libraries(${PROJECT_NAME}.elf   FreeRTOS)

#Assembly options
set(CMAKE_ASM_FLAGS "${CFLAGS} -Wa,--defsym=__MPLAB_BUILD=1,--gdwarf-2")
#Compiler flags and options
set(MPROCESSOR -mprocessor=${PIC})
set(MOPTIMIZATION -O${OPTIMIZATION})
set(DEFINES ${USER_DEFINITIONS})
set(SYM_HEAP --defsym=_min_heap_size=${HEAP})
set(SYM_BUILD --defsym=__MPLAB_BUILD=1)
set(LINKER_OPTS --gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem)
set(LINKER_MAP -Map=${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map)
set(MEMORY_FILE --memorysummary,${CMAKE_CURRENT_BINARY_DIR}/memoryfile.xml)

set(XC32_LINK_FLAGS
        ${SYM_HEAP},${SYM_BUILD},${LINKER_OPTS},${LINKER_MAP},${MEMORY_FILE}
        )


#HEX file build command
add_custom_command(
        OUTPUT  ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex
        DEPENDS ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.elf
        COMMAND /opt/microchip/xc32/v4.21/bin/xc32-bin2hex ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.elf
)
add_custom_target(${PROJECT_NAME}_hex ALL
        DEPENDS ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex
        )


target_compile_options(${PROJECT_NAME}.elf PUBLIC ${USER_FLAGS} ${MPROCESSOR} ${MOPTIMIZATION} -fdata-sections -ffunction-sections -no-legacy-libc -mdfp=${DFP})
target_compile_definitions(${PROJECT_NAME}.elf PUBLIC XPRJ_default=default ${DEFINES})
target_link_options(${PROJECT_NAME}.elf PUBLIC ${MPROCESSOR} ${MOPTIMIZATION} )
target_link_libraries(${PROJECT_NAME}.elf "-Wl,${XC32_LINK_FLAGS}")
