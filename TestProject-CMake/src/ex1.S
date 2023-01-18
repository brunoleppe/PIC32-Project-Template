/*
** file: ex1.S
*/
#include <xc.h>
 /* define which section (for example "text")
 * does this portion of code resides in. Typically,
 * all your code will reside in .text section as
 * shown below.
 */
 .text
 /* This is important for an assembly programmer. This
 * directive tells the assembler that don't optimize
 * the order of the instructions as well as don't insert
 * 'nop' instructions after jumps and branches.
 */
 .set noreorder
/*********************************************************************
* asmFunction(int bits)
* This function clears the specified bites in IOPORT A.
********************************************************************/
.global asmFunction
.ent asmFunction
asmFunction:
/* function prologue - save registers used in this function
 * on stack and adjust stack-pointer
 */
    addiu sp, sp, -4
    sw s0, 0(sp)
    la s0, LATACLR
    sw a0, 0(s0) /* clear specified bits */
    la s0, PORTA
    lw s1, 0(s0)
    la s0, cVariable
    sw s1, 0(s0) /* keep a copy */
    /* function epilogue - restore registers used in this function
    * from stack and adjust stack-pointer
    */
    lw s0, 0(sp)
    # addiu sp, sp,
    addu s1, ra, zero
    jal foo
    nop
    addu ra, s1, zero
    nop
    /* return to caller */
    jr ra
    nop
.end asmFunction
    .bss
    .global asmVariable
    .align 2
asmVariable: .space 4