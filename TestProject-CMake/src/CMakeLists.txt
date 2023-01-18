cmake_minimum_required(VERSION 3.22.1)

set(PIC  32MZ1024EFM100)
set(OPTIMIZATION 1)
set(USER_FLAGS -Wall)
set(DEFINES BRUNO LEPPE)
set(HEAP 0x1000)

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


set(SYM_HEAP --defsym=_min_heap_size=${HEAP})
set(SYM_BUILD --defsym=__MPLAB_BUILD=1)
set(LINKER_OPTS --gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem)
set(LINKER_MAP -Map=${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map)
set(MEMORY_FILE --memorysummary,${CMAKE_CURRENT_BINARY_DIR}/memoryfile.xml)

set(XC32_LINK_FLAGS 
    ${SYM_HEAP},${SYM_BUILD},${LINKER_OPTS},${LINKER_MAP},${MEMORY_FILE}
)

add_custom_command(
  OUTPUT  ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex
  DEPENDS ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.elf
  COMMAND xc32-bin2hex ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.elf
  )

add_custom_target(${PROJECT_NAME}.hex ALL
    DEPENDS ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex
)

target_compile_options(${PROJECT_NAME}.elf PUBLIC ${USER_FLAGS} ${MPROCESSOR} ${MOPTIMIZATION} -no-legacy-libc)
target_compile_definitions(${PROJECT_NAME}.elf PUBLIC XPRJ_default=default ${DEFINES})
target_link_options(${PROJECT_NAME}.elf PUBLIC ${MPROCESSOR} ${MOPTIMIZATION} )
target_link_libraries(${PROJECT_NAME}.elf "-Wl,${XC32_LINK_FLAGS}")