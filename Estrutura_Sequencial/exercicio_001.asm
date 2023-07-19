; 1. Faça um Programa que mostre a mensagem "Alo mundo" na tela.

section .data
        
    msg db 'Olá, mundo !', 0x0A    ; 10 é o código de escape para '\n'
    len equ $ - msg                ; contagem automática de caracteres da msg

section .text

    global _start  ; nome do rótulo para dá início ao programa 

_start:

    ;Chamada sys_write para saida padrão de dados
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    ;Chamada sys_exit para fechamento do programa
    mov rax, 60
    mov rdi, 0
    syscall

