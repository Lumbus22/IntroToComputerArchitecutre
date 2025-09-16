#int main(void){
#    int n = 4;
#    int r = transform(n);
#    result = r;
#    return 0;
#    }
#
#
#
#
#
#
#

main:
    li a0, 4 #storing n
    jal ra, transform
    la t0, result
    sw a0, 0(t0)
    li a0, 0 #return r (optional)
    ret

inc2:
    addi a0, a0, 2 #x = x + 2; a0 = x+ 2
    ret
    
sqaure:
    mv t2, a0 #t2 = a0; t2 = x
    li t0, 0 #y = 0; t0 = y
    li t1, 0 #i = 0; t1 = i
    
sq_loop:
    bge t1, t2, sq_done
    add t0, t0, t2 #y = y + x
    addi t1, t1, 1
    j sq_loop
    
sq_done:
    mv a0, t0
    ret
    
tranform:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw s1, 8(sp) #s1
    sw a0, 4(sp) #x  
    jal square
    mv s1, a0
    lw a0, 4(sp)
    jal ra, inc2
    sub a0, s1, a0
    

    
    
    