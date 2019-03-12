.globl matrix_multiply_asm


#a corriger
matrix_multiply_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        subl $4, %esp           #i
        movl $0, -4(%ebp)
        
        subl $4, %esp           #r
        movl $0, -8(%ebp)
  	
  	movl $0, %edi           #c
	movl 16(%ebp), %ecx     #outmatdata
  	jmp ConditionBoucle1


  	ConditionBoucle1 : 

                movl -8(%ebp), %esi
  		cmpl 20(%ebp), %esi 		
 		jl ConditionBoucle2
                movl %ecx, 16(%ebp)
 		leave          /* Restore ebp and esp */
                ret            /* Return to the caller */

 	
 	ConditionBoucle2:
                movl $0, %ebp
 		cmpl 20(%ebp), %edi
 		jl ConditionBoucle3 
 		jmp FinBoucle1


        ConditionBoucle3:
                
                movl -4(%ebp),%eax
                cmpl 20(%ebp), %eax
 		jl Boucle 
 		jmp FinBoucle2


 	Boucle:
  

 		movl 20(%ebp),%ebx
 		imul -8(%ebp),%ebx
 		addl -4(%ebp),%ebx
		
                movl 20(%ebp),%eax
 		imul -4(%ebp),%eax
 		addl %edi,%eax
 		
                
 		movl 8(%ebp), %edx      #inmatdata1
                movl 12(%ebp), %esi     #inmatdata2

                movl (%edx, %ebx, 4), %edx
                movl (%esi, %eax, 4), %esi
 		
                imul %edx, %esi
                addl %esi, %ebp

 	        jmp FinBoucle3

 	FinBoucle1:
 		#c++
		addl $1,-8(%ebp)
		#vérifie si i respecte toujours la condition
		movl $0, %edi
                
		jmp ConditionBoucle1
                

	FinBoucle2:
                movl 20(%ebp),%ebx
 		imul -8(%ebp),%ebx
 		addl %edi,%ebx 

                movl %ebp, (%ecx, %ebx, 4)
		addl $1, %edi
		jmp ConditionBoucle2          

        FinBoucle3:

                addl $1, -4(%ebp) 
                jmp ConditionBoucle3
		

