.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:
        push %ebp      /* save old base pointer*/
        mov %esp, %ebp /* set ebp to current esp */
        
        movl 8(%ebp), %eax
        fldpi           #charger pi sur le FPU
        fld 4(%eax)
        fmulp
        fld 4(%eax)
        fmulp
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
