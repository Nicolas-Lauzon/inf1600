.globl matrix_diagonal_asm

matrix_diagonal_asm:

        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

  		movl $0, %esi
  		movl $0, %edi
		movl 12(%ebp), %ecx 	#%ecx <- outmatdata
  		jmp ConditionBoucle1


  	ConditionBoucle1 : 

  		cmpl 16(%ebp), %esi 	#%esi = r		
 		jl ConditionBoucle2		#si r < matorder -> aller a ConditionBoucle2
        movl %ecx, 12(%ebp)		#mettre le resultat final dans outmatdata
 		leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

 	
 	ConditionBoucle2:
 		cmpl 16(%ebp), %edi		#%edi = c
 		jl Boucle 				#si c < matorder -> faire la boucle 
 		jmp FinBoucle1

 	Boucle:
  
 		movl 16(%ebp),%ebx
 		imul %esi,%ebx
 		addl %edi,%ebx			#deplacement : c + r * matorder
		
        
 		movl 8(%ebp), %edx		#edx <- inmatdata
 		
        cmpl %esi, %edi			#si c = r -> aller dans Diagonale
        je Diagonale 

		movl $0, (%ecx, %ebx, 4) 	#sinon mettre 0 dans %ecx[c + r * matorder]
        
 	    jmp FinBoucle2

 	FinBoucle1:
 		#c++
		addl $1,%esi		#incrementation de r
		#vérifie si i respecte toujours la condition
		movl $0, %edi		#remettre c <- 0
		jmp ConditionBoucle1

	FinBoucle2:

		addl $1, %edi		#incrementation de c
		jmp ConditionBoucle2           /* return to the caller */

    Diagonale: 
        movl (%edx,%ebx,4), %edx		#%edx <- inmatdata[c + r * matorder]
		movl %edx, (%ecx, %ebx, 4) 		#%ecx[c + r * matorder] <- %edx
        jmp FinBoucle2