.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        movl 8(%ebp), %eax
        movl 0(%eax), %ebx
        subl $4, %esp
        push %eax

        call *20(%ebx)
        fld factor
        fmulp
        fld 12(%eax)
        fdivrp


        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
