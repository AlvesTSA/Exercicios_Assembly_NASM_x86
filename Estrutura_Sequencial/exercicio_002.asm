;2. Faça um Programa que peça um número e então mostre a mensagem O número informado foi [número].

section .data

    msg1 db "Informe um número", 10
    len_msg1 equ $-msg1

    msg2 db "O número informado foi: "
    len_msg2 equ $-msg2

section .bss

    num resb 20

section .text

    global _start

_start:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, len_msg1
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, num
    mov rdx, 20
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len_msg2
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, num
    mov rdx, 20
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall