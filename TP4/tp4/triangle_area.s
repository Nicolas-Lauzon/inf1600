.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        subl $8, %esp
        movl 8(%ebp), %eax
        push %eax


        movl 0(%eax), %ebx
        call *12(%ebx)
        fld factor
        fdivrp 
        fstp -4(%ebp)

        fld 12(%eax)
        fld -4(%ebp)
        fsubp
        fstp -8(%ebp)

        fld 8(%eax)
        fld -4(%ebp)
        fsubp
        fld -8(%ebp)
        fmulp
        fstp -8(%ebp)

        fld 4(%eax)
        fld -4(%ebp)
        fsubp
        fld -8(%ebp)
        fmulp
        fld -4(%ebp)
        fmulp
        fsqrt


        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
