.data
mensaje_serie: .asciiz "Ingrese la cantidad de digitos a generar de la serie Fibonacci: "
convencion: .asciiz " -- > " 
.text
.globl main
main:
   
   # Constante para restar 
   li $t6,3
   
   # Imprimo en pantalla mensaje  solicitando la cantidad de numeros de la serie
   li $v0,4 # Llamada al sistema para imprimir una cadena
   la $a0, mensaje_serie # Cargamos en a0 la direccion de memoria de la variable mensaje_serie
   syscall
         
   # Caputuro la cantidad de numeros de la serie a generar
    li $v0,5
    syscall
    move $t0, $v0 # Muevo el numero ingresado de $v0 a $t0
    
    sub $t0,$t0,$t6 # Genero Resta a la cantidad de numero a imprimir , dado que los tres primeros los genero
   
   # Genero  tres constantes con el valor de 1
    li $t1, 1 #
    li $t2,1 #
    li $t5,1 #

   # Imprimo en pantalla el valor de $t1 -- > Primer numero de la serie Fibonacci (1)
    li $v0,1
    move $a0,$t1
    syscall
    
    # Imprimo en pantalla la variable convención
    li $v0,4 # Llamada al sistema para imprimir una cadena
    la $a0, convencion # Cargamos en a0 la direccion de memoria de la variable convencion
    syscall
    
    # Imprimo en pantalla el valor de $t1  -- > Segundo numero de la serie Fibonacci (1)	       	       
    li $v0,1
    move $a0,$t1
    syscall
    
    # Imprimo en pantalla la variable convención
    li $v0,4 # Llamada al sistema para imprimir una cadena
    la $a0, convencion # Cargamos en a0 la direccion de memoria de la variable convencion
    syscall
    
    # Genero suma para obtener el tercer numero de la serie Fibonacci (2)
    add $t3, $t1,$t1    
    
    # Imprimo en pantalla el valor de $t3  -- > Tercer numero de la serie Fibonacci (2)
    li $v0,1
    move $a0,$t3
    syscall
    
    # Imprimo en pantalla la variable convención
    li $v0,4 # Llamada al sistema para imprimir una cadena
    la $a0, convencion # Cargamos en a0 la direccion de memoria de la variable convencion
    syscall
              
   # Inicio del ciclo
ciclo:       
         add $t4,$t3,$t1 # Genero suma del tercer numero de la serie Fibonacci(2) y el Segundo numero de la serie Fibonacci(1)
         
         # Imprimo en pantalla el valor de $t4  -- > Cuarto numero de la serie Fibonacci (3) 
         li $v0,1
         move $a0,$t4
         syscall
          
         # Imprimo en pantalla la variable convención
   	 li $v0,4 # Llamada al sistema para imprimir una cadena
   	 la $a0, convencion # Cargamos en a0 la direccion de memoria de la variable convencion
   	 syscall
   
         move $t1,$t3 # Muevo valor de $t3 a $t1
         move $t3,$t4 # Muevo valor de $t4 a $t3
         
         add $t2,$t2,$t5 # Aumento el contador
        
         ble $t2,$t0,ciclo # Validacion para seguir a la siguiente iteracion.
         
        # Finalización del programa 
	li $v0,10
	syscall
