.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text
main:
    addi t0, x0, 0   # t0 inicializa K
    addi s0, x0, 0   # s0 inicializa Sum
    la s1, source    # s1 recebe o endereço de source
    la s2, dest      # s2 rebece o endereço de dest
loop:
    slli s3, t0, 2   # s3 recebe K*4, a ideia é que cada unidade de K represente uma palavra... Genial, não?
    add t1, s1, s3   # t1 recebe source+K*4, ou seja source[K]
    lw t2, 0(t1)     # t2 recebe source[K]
    beq t2, x0, exit # if (source[K]==0) exit;
    add a0, x0, t2   # a0 recebe source[K], a0 é o argumento x a ser passado para square
    addi sp, sp, -8  # ?
    sw t0, 0(sp)     # ?
    sw t2, 4(sp)     # ?
    jal square       # ?
    lw t0, 0(sp)     # ?
    lw t2, 4(sp)     # ?
    addi sp, sp, 8   # ?
    add t2, x0, a0   # ?
    add t3, s2, s3   # ?
    sw t2, 0(t3)     # ?
    add s0, s0, t2   # ?
    addi t0, t0, 1   # ?
    jal x0, loop     # ?
square:
    add t0, a0, x0   # t0 recebe x (veja a linha 33)
    add t1, a0, x0   # t1 recebe x
    addi t0, t0, 1   # t0 recebe x+1
    addi t2, x0, -1  # t2 recebe -1 (valor que multiplicará x)
    mul t1, t1, t2   # t1 recebe x*-1
    mul a0, t0, t1   # prepara para retornar (x*-1)*(x+1)
    jr ra            # retorna o controle do processo
exit:
    add a0, x0, s0   # Prepara o retorno de sum
    add a1, x0, x0   # Limpa o registrador não usado no retorno
    ecall # Terminate ecall