.globl matrix_multiply_asm


#a corriger
matrix_multiply_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        subl $12, %esp          
        movl $0, -4(%ebp)		#i : indice
        movl $0, -8(%ebp)	    #r: row(ligne)
		movl $0, -12(%ebp)		#c: colonne

		movl 16(%ebp), %ecx     #outmatdata
  		jmp ConditionBoucle1


  	ConditionBoucle1 : 

        movl -8(%ebp), %esi		#mettre r dans %esi
  		cmpl 20(%ebp), %esi 		
 		jl ConditionBoucle2		#si r<matorder -> aller a ConditionBoucle2
        movl %ecx, 16(%ebp)		#mettre la matricee résultante dans la bonne mémoire (outmatdata)
 		leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

 	
 	ConditionBoucle2:
		movl $0, %edi			#mettre elem a 0
		movl -12(%ebp), %esi	#mettre c dans %esi
 		cmpl 20(%ebp), %esi		
 		jl ConditionBoucle3 	#si c<matorder -> aller a ConditionBoucle3
 		jmp FinBoucle1			#sinon aller a FinBoucle1


    ConditionBoucle3:
                
        movl -4(%ebp),%esi		#mettre i dans %esi
        cmpl 20(%ebp), %esi
 		jl Boucle 				#si i<matorder -> faire la boucle
 		jmp FinBoucle2			#sinon aller a ConditionBoucle2


 	Boucle:
  

 		movl 20(%ebp),%ebx		#%ebx <- matorder
 		imul -8(%ebp),%ebx		#%ebx <- %ebx*r
 		addl -4(%ebp),%ebx		#premier deplacement = i+r*matorder
		
        movl 20(%ebp),%eax		#%eax <- matorder
 		imul -4(%ebp),%eax		#%eax <- %eax*i
 		addl -12(%ebp),%eax		#deuxieme deplacement = c+i*matorder
 		
                
 		movl 8(%ebp), %edx      #inmatdata1
        movl 12(%ebp), %esi     #inmatdata2

        movl (%edx, %ebx, 4), %edx 		#%edx <- inmatdata1[i + r * matorder]
        movl (%esi, %eax, 4), %esi		#%esi <- inmatdata2[c + i * matorder]
 		
        imul %edx, %esi			
        addl %esi, %edi 		#%edi = elem

 		jmp FinBoucle3

 	FinBoucle1:
 		#c++
		addl $1,-8(%ebp)		#incrementation de r
		#vérifie si i respecte toujours la condition
		movl $0, -12(%ebp)		#remettre c <- $0
                
		jmp ConditionBoucle1
                

	FinBoucle2:
        movl 20(%ebp),%ebx
 		imul -8(%ebp),%ebx
 		addl -12(%ebp),%ebx 		#deplacement c + r * matorder

        movl %edi, (%ecx, %ebx, 4) 	#mettre %elem-> outmatdata[c + r * matorder]
		addl $1, -12(%ebp)		#incrementation de c
		movl $0, -4(%ebp)		#remettre 0 -> i
		jmp ConditionBoucle2          

    FinBoucle3:

        addl $1, -4(%ebp) 		#incrementation de i
        jmp ConditionBoucle3
		

