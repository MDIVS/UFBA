.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # y = x--;
    add t0, x0, a0
    addi a0, a0, -1

    # i = x;
    add t1, x0, a0

loop:
    # if i==0: break
    beq t1, x0, exit

    # y *= x--;
    mul t0, t0, a0
    addi a0, a0, -1

    # i--;
    addi t1, t1, -1

    # continue
    jal x0, loop

exit:
    add a0, x0, t0   # Prepara o retorno de y
    add a1, x0, x0   # Limpa o registrador não usado no retorno
    jr ra            # retorna o controle do processo
