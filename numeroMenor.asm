.data
mensj_numero1: .asciiz "Introduce el primer numero: "
mensj_numero2: .asciiz "Introduce el segundo numero: "
mensj_numero3: .asciiz "Introduce el tercer numero: "
salida: .asciiz "\n El numero menor es: "
.text 
.globl main
main:
    
    # Genero una constante con el valor de 2
    li $s0, 2
    
    		
    # Imprimo en pantalla mensaje  solicitando el primer numero
    li $v0,4 # Llamada al sistema para imprimir una cadena
    la $a0, mensj_numero1 # Cargamos en a0 la direccion de memoria de la variable mensj_numero1
    syscall
    
    # Caputuro el primer numero
    li $v0,5
    syscall
    move $t0, $v0 # Muevo el numero1 ingresado en $v0 a $t0
    
    # Imprimo en pantalla mensaje  solicitando el segundo numero
    li $v0,4 # Llamada al sistema para imprimir una cadena
    la $a0, mensj_numero2 # Cargamos en a0 la direccion de memoria de la variable mensj_numero2
    syscall
    
    # Caputo el segundo numero
    li $v0,5
    syscall
    move $t1, $v0  # Muevo el numero1 ingresado en $v0 a $t0
    
    # Imprimo en pantalla mensaje  solicitando el tercer numero
    li $v0,4 # Llamada al sistema para imprimir una cadena
    la $a0, mensj_numero3 # Cargamos en a0 la direccion de memoria de la variable mensj_numero3
    syscall
    
    # Caputo el tecer numero
    li $v0,5
    syscall
    move $t2, $v0  # Muevo el numero1 ingresado en $v0 a $t0
    
    # Condicionales para determinar el numero mayor
    slt $t3,$t0,$t1 # Evalua si el numero1 < numero 2 --> {True: 1 , False:0}
    slt $t4,$t0,$t2 # Evalua si el numero1 < numero 3 --> {True: 1 , False:0} 
    add $t7,$t3,$t4 # Genera suma de los condicionales $t3, $t4 
    beq $t7,$s0,numero1_mayor # Si el reaultado de la suma == 2, salta a la etiqueta
    
    slt $t5,$t1,$t0 # Evalua si el numero2 < numero 1 --> {True: 1 , False:0}
    slt $t6,$t1,$t2 # Evalua si el numero2 < numero 3 --> {True: 1 , False:0} 
    add $t8,$t5,$t6 # Genera suma de los condicionales $t5, $t6 
    beq $t8, $s0,numero2_mayor # Si el reaultado de la suma == 2, salta a la etiqueta
    
    add $t9,$t7,$t8 # Genera suma de los condicionales $t7, $t8 
    blt $t9, $s0,numero3_mayor # Si el reaultado de la suma < 2, salta a la etiqueta

numero1_mayor:    
    # Imprimo en pantalla mensaje  con resultado
    li $v0,4 # Lo coloco en modo impresion
    la $a0,salida # Cargo la salida a imprimir en $a0
    syscall

    # Imprimo la variable Salida con el numero ingresado
    li $v0,1
    move $a0,$t0
    syscall

    # Finalización del programa		    	    
    li $v0,10
    syscall

    

numero2_mayor:    
    # Imprimo en pantalla mensaje  con resultado
    li $v0,4 # Lo coloco en modo impresion
    la $a0,salida # Cargo la salida a imprimir en $a0
    syscall

    # Imprimo la variable Salida con el numero ingresado
    li $v0,1
    move $a0,$t1
    syscall
    
    # Finalización del programa
    li $v0,10
    syscall

numero3_mayor:    
    # Imprimo en pantalla mensaje  con resultado
    li $v0,4 # Lo coloco en modo impresion
    la $a0,salida # Cargo la salida a imprimir en $a0
    syscall

    # Imprimo la variable Salida con el numero ingresado
    li $v0,1
    move $a0,$t2
    syscall
    
    # Finalización del programa
    li $v0,10
    syscall


    
    
    
    
     
