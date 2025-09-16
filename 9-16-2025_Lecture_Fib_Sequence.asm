# WE are converting the fib sequence in c code to RV32I assembly

#a0 is base fib value
#a1 is n -1
#
#

main:
    li a0, 6 #ao = n
    jal fib #recursion call fib(n) - > 0
    la t0, result #result  =n int  n = fib(n)
    sw a0, 0(t0) #store r
    li a0, 0
    ret
    
    
    
fib:
    addi sp, sp, -16 # alocating space for arguments and return addresses
    sw ra, 12(sp)
    sw s1, 8(sp)
    sw a0, 4(sp) 
    li t0, 2  #to compare with n < 2
    blt a0, t0, fib_base
    addi a0, a0, -1 #a0 = n - 1
    jal fib
    mv s1, a0 #s1 = fib(n-1)
    lw a0, 4(sp) #n
    addi a0, a0, -2 #a0 = n - 2
    jal ra, fib #fib(n-2) -> a0
    add a0, a0, s1 # a0 = fib(n -1) + fib(n - 2)
    j fib_done

fib_done:
    lw s1, 8(sp)
    lw ra, 16(sp)
    addi sp, sp, 16 #return the stack values
    ret
    
    
fib_base:
    #Our value is alread in a0
    
    
  