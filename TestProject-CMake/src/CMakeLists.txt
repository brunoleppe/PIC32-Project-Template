cmake_minimum_required(VERSION 3.22.1)

set(CMAKE_C_COMPILER xc32-gcc)

set(PIC  32MZ1024EFM100)
set(OPTIMIZATION 1)
set(USER_FLAGS -Wall)
set(USER_DEFINES BRUNO LEPPE)
set(HEAP 0)


# set(CMAKE_VERBOSE_MAKEFILE True)

set(SOURCES 
    initialization.c
    main.c
)

project(test C ASM)

include_directories(FreeRTOS/Source/include)
include_directories(FreeRTOS/Source/portable/MPLAB/PIC32MZ)
include_directories(/home/bleppe//Documents/Github/PIC32-Project-Template/TestProject-CMake/src)
add_subdirectory(FreeRTOS)

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

set(DEFINES ${USER_DEFINES} __${PIC}__ __PIC32MZ__)

target_compile_options(${PROJECT_NAME}.elf PUBLIC ${USER_FLAGS} ${MPROCESSOR} ${MOPTIMIZATION} -fdata-sections -ffunction-sections -no-legacy-libc)
target_compile_definitions(${PROJECT_NAME}.elf PUBLIC XPRJ_default=default ${DEFINES})
target_link_options(${PROJECT_NAME}.elf PUBLIC ${MPROCESSOR} ${MOPTIMIZATION} )
target_link_libraries(${PROJECT_NAME}.elf "-Wl,${XC32_LINK_FLAGS}")
target_link_libraries(${PROJECT_NAME}.elf FreeRTOS)