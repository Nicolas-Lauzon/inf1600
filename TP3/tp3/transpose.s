.globl matrix_transpose_asm

matrix_transpose_asm:

        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

  		movl $0, %esi
  		movl $0, %edi
		movl 12(%ebp), %ecx 		#%ecx <- outmatdata
  		jmp ConditionBoucle1


  	ConditionBoucle1 : 

  		cmpl 16(%ebp), %esi 		#%esi = r	
 		jl ConditionBoucle2			#si r < matorder -> faire ConditionBoucle2
        movl %ecx, 12(%ebp)			#mettre le resultat final dans outmatdatat
 		leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

 	
 	ConditionBoucle2:
 		cmpl 16(%ebp), %edi			#%edi = c
 		jl Boucle 					#si c < matorder -> faire la boucle 
 		jmp FinBoucle1 				#sinon faire ConditionBoucle1 

 	Boucle:
  

 		movl 16(%ebp),%ebx
 		imul %esi,%ebx
 		addl %edi,%ebx 				#deplacement de inmatdata: c + r * matorder
		
		movl 16(%ebp),%eax
 		imul %edi,%eax
 		addl %esi,%eax 				#deplacement de outmatdata : r + c * matorder
 		
 		movl 8(%ebp), %edx 			#%edx <- inmatdata
 		
		movl (%edx,%ebx,4), %edx	#%edx <- inmatdata[r + c * matorder]
		movl %edx, (%ecx, %eax, 4)	#outmatdata[c + r * matorder] <- %edx
 		

 	    jmp FinBoucle2

 	FinBoucle1:
 		#c++
		addl $1,%esi 		#increment de r
		#vérifie si i respecte toujours la condition
		movl $0, %edi		#remettre c <- 0
		jmp ConditionBoucle1

	FinBoucle2:

		addl $1, %edi		#increment de c
		jmp ConditionBoucle2           /* return to the caller */