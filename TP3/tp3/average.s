.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        subl $4, %esp       
        movl $0, -4(%ebp)		#r (ligne)

        movl $0, %eax			#%eax = elem
  		movl $0, %esi
  		movl $0, %edi
		movl 12(%ebp), %ecx		#outmatdata
  		jmp ConditionBoucle1


  	ConditionBoucle1 : 
        
		movl $0, %eax			#remettre elem <- 0
        movl -4(%ebp), %esi		#r
  		cmpl 16(%ebp), %esi 	#compare matorder to r		
		movl $0, %esi			#remettre %esi a 0 pour l'utiliser pour l'addition dans la boucle
 		jl ConditionBoucle2		#si inferieur: faire la boucle
        movl %ecx, 12(%ebp)		#mettre le resultat final dans outmatdata
 		leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

 	
 	ConditionBoucle2:
 		cmpl 16(%ebp), %edi 	#compare matorder a c
 		jl Boucle 				#si c < matorder -> faire la boucle 
 		jmp FinBoucle1			#sinon alle a FinBoucle1

 	Boucle:
  

 		movl 16(%ebp),%ebx
 		imul -4(%ebp),%ebx
 		addl %edi,%ebx			#deplacement de inmatdata : c + r * matorder
		
 		
 		movl 8(%ebp), %edx		#%edx <- inmatdata
 		
		movl (%edx,%ebx,4), %edx 	#edx <- inmatdata[c + r * matorder]
		addl %edx, %eax 			#elem += %edx
 		

 	    jmp FinBoucle2

 	FinBoucle1:
 		#c++
		movl $0, %edx				#pour la division
        divl 16(%ebp)           	# %eax <- %eax/matorder
        movl -4(%ebp),%esi			#remettre r dans %esi
        movl %eax, (%ecx,%esi , 4)	#elem/matorder -> outmatdata[r]	
        addl $1,-4(%ebp)			#incrementation de r 
		#vérifie si i respecte toujours la condition
		movl $0, %edi 				#mise a 0 de c
        #movl -4(%ebp), %ebx
        
        
		jmp ConditionBoucle1

	FinBoucle2:

		inc %edi 					#incrementation de c
		jmp ConditionBoucle2           /* return to the caller */
		

