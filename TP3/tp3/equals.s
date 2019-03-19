.globl matrix_equals_asm

matrix_equals_asm:

        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

  		movl $0, %esi
  		movl $0, %edi
  		jmp ConditionBoucle1


  	ConditionBoucle1 : 
  			cmpl 16(%ebp), %esi 	#%esi = r (ligne)	
 			jl ConditionBoucle2		#si r < matorder -> aller a ConditionBoucle2
 			movl $1, %eax			#si le bool est vrai, alors retourne 1.
 		  	leave          /* Restore ebp and esp */
        	ret            /* Return to the caller */

 	
 	ConditionBoucle2:
 			cmpl 16(%ebp), %edi		#%edi = c (colonne)
 			jl Boucle 				#si c < matorder -> faire la boucle
 			jmp FinBoucle1

 	Boucle:

 		movl 16(%ebp),%ebx
 		imul %esi,%ebx
 		addl %edi,%ebx 			#calculer le daplacement : c + r * matorder
 		
		movl 12(%ebp), %ecx		#%ecx <- inmatdata2
 		movl 8(%ebp) , %edx		#%edx <- inmatdata1
 		
		movl (%edx,%ebx,4), %edx	#%edx <- inmatdata1[c + r * matorder]
 		movl (%ecx, %ebx, 4), %ecx	#%ecx <- inmatdata2[c + r * matorder]
 		
		cmpl %edx,%ecx
 		jne Condition 		#si inmatdata1[c + r * matorder] !=inmatdata2[c + r * matorder] -> aller a condition
 		jmp FinBoucle2

 	Condition:
 		movl $0, %eax 		#donner le resultat booleen faux (=0)
 		leave
 		ret

 	FinBoucle1:
 		#c++
		addl $1,%esi		#increment de r
		#vérifie si i respecte toujours la condition
		movl $0, %edi		#remettre c <- 0
		jmp ConditionBoucle1

	FinBoucle2:

		addl $1, %edi		#increment de c
		jmp ConditionBoucle2