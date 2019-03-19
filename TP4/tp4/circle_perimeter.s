.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        movl 8(%ebp), %eax
        fldpi           #charger pi sur le FPU
        fld 4(%eax)
        fmulp
        fld factor
        fmulp

        
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
