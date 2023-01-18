cmake_minimum_required(VERSION 3.22.1)

set(PIC  32MZ1024EFM100)
set(OPTIMIZATION 1)
set(USER_FLAGS -Wall)


set(CMAKE_C_COMPILER xc32-gcc)
set(CMAKE_VERBOSE_MAKEFILE True)

set(SOURCES 
    delay.c
    initialization.c
    main.c
    ex1.S
)

project(test C ASM)
add_executable(${PROJECT_NAME}.elf ${SOURCES})


SET(CMAKE_ASM_FLAGS "${CFLAGS} -Wa,--defsym=__MPLAB_BUILD=1,--gdwarf-2")

set(MPROCESSOR -mprocessor=${PIC})
set(MOPTIMIZATION -O${OPTIMIZATION})

set(XC32_LINK_FLAGS 
    --defsym=_min_heap_size=0x1000,--defsym=__MPLAB_BUILD=1,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map=${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map,--memorysummary,${CMAKE_CURRENT_BINARY_DIR}/memoryfile.xml)

# set(CMAKE_ASM_FLAGS "${CFLAGS}")



target_compile_options(${PROJECT_NAME}.elf PUBLIC ${USER_FLAGS} ${MPROCESSOR} ${MOPTIMIZATION} -no-legacy-libc)
target_compile_definitions(${PROJECT_NAME}.elf PUBLIC XPRJ_default=default)
target_link_options(${PROJECT_NAME}.elf PUBLIC ${MPROCESSOR} ${MOPTIMIZATION} )
target_link_libraries(${PROJECT_NAME}.elf "-Wl,${XC32_LINK_FLAGS}")

message("${PROJECT_SOURCE_DIR}")