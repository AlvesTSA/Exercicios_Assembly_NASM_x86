;3. Faça um Programa que peça dois números e imprima a soma. 

section .data

    msg1 db "Informe o primeiro número: ", 10, 0
    len_msg1 equ $-msg1

    msg2 db "Informe o segundo número: ", 10, 0
    len_msg2 equ $-msg2

    msg3 db "O resultado da soma: ", 0
    len_msg3 equ $-msg3

    next_line db 10

section .bss

    s_num1 resb 21
    s_num2 resb 21
    s_result resb 21

    int_num1 resq 1
    int_num2 resq 1

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
    mov rsi, s_num1
    mov rdx, 21
    syscall

    call string_to_int
    mov [int_num1], rax

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len_msg2
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, s_num2 
    mov rdx, 21
    syscall

    call string_to_int
    mov [int_num2], rax 
    
    mov rax, 1
    mov rdi, 1
    mov rsi, msg3
    mov rdx, len_msg3
    syscall
    
    mov rax, [int_num1]
    add rax, [int_num2]
    call int_to_string
     
    mov rax, 1
    mov rdi, 1
    mov rsi, s_result
    mov rdx, 21
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, next_line
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall


        ;----------------------------------
        ; string para inteiro
        ;----------------------------------
        ; Entrada: RSI (valor conv) RCX (tam)
        ; Saida..: RAX
        ;----------------------------------

string_to_int:

    xor rbx, rbx 
    xor rcx, rcx 
    mov rdi, rsi

    count_string_loop:

        movzx rax, byte [rsi] 
        test al, al           
        jz count_string_loop_done        
        inc rcx               
        inc rsi              
        jmp count_string_loop     
    count_string_loop_done:
   
        dec rcx
        string_to_int_next_digit:

            movzx rax, byte [rdi]
            inc rdi
            sub al, '0'
            imul rbx, 0xA
            add rbx, rax 
        loop string_to_int_next_digit 

            mov rax, rbx
            ret


        ;----------------------------------
        ; inteiro para string
        ;----------------------------------
        ; Entrada: inteiro em RAX
        ; Saida..: BUFFER (valor RSI) TAM_BUFFER (RDX)
        ;----------------------------------

int_to_string:

    lea rsi, [s_result]
    add rsi, 0x15
    mov byte [rsi], 0xA
    mov rbx, 0xA

    int_to_string_next_digit:

        xor rdx, rdx
        div rbx
        add dl, '0'
        dec rsi
        mov [rsi], dl
        test rax, rax
        jnz int_to_string_next_digit
        ret    
