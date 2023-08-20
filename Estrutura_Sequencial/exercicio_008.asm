;8. Faça um Programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês. Calcule e mostre o total do seu salário no referido mês.

section .data

    msg1 db "Quianto você ganha por hora ?: ",10,0
    len_msg1 equ $-msg1
    
    msg2 db "Quantas horas você trabalhou no mes: ",10,0
    len_msg2 equ $-msg2

    msg3 db "Salário total R$: ",0
    len_msg3 equ $-msg3

    next_line db 10

section .bss

    s_ganho_hora resb 21
    s_hora_mes resb 21
    salario resb 21

    d_ganho_hora resq 1

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
    mov rsi, s_ganho_hora
    mov rdx, 21
    syscall

    call string_to_double
    movsd [d_ganho_hora], xmm0

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len_msg2
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, s_hora_mes
    mov rdx, 21
    syscall

    call string_to_double
   
    mulsd xmm0, [d_ganho_hora]

    call double_to_string

    mov rax, 1
    mov rdi, 1
    mov rsi, msg3
    mov rdx, len_msg3
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, salario
    mov rdx, 21
    syscall

    mov rax, 1 
    mov rdi, 1
    mov rsi, next_line
    mov rdx, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

;----------------------------------
; string para double
;----------------------------------
; Entrada: string em RSI
; Saida..: valor de ponto flutuante em XMM0 (acumulador)
;----------------------------------

string_to_double:

    xor rax, rax
    pxor xmm0, xmm0
    pxor xmm1, xmm1
    pxor xmm2, xmm2
    pxor xmm3, xmm3
    mov rbx, 10
    cvtsi2sd xmm3, rbx
    movsd xmm2, xmm3
    
    string_to_double_int_part_next_digit_loop:

        mov al, byte[rsi]
        cmp al, '.'
        je string_to_double_decimal_part_next_digit_loop
        
        sub al, '0'
        cvtsi2sd xmm1, rax
        mulsd xmm0, xmm3
        addsd xmm0, xmm1
        inc rsi

    jmp string_to_double_int_part_next_digit_loop
    
    string_to_double_decimal_part_next_digit_loop:
        
        inc rsi
        mov al, byte[rsi]
        cmp al, 0xA
        je string_to_double_done

        sub al, '0'
        cvtsi2sd xmm1, rax
        divsd xmm1, xmm2
        addsd xmm0, xmm1
        mulsd xmm2, xmm3
        
    jmp string_to_double_decimal_part_next_digit_loop

string_to_double_done:
    ret


;----------------------------------
; double para string
;----------------------------------
; Entrada: double em xmm0
; Saida..: buffer (RDI)
; Precisão de casas decimais em RCX
;----------------------------------

double_to_string:  

    pxor xmm1, xmm1
    pxor xmm2, xmm2
    xor rdi, rdi
    xor r8, r8

    mov rbx, 10
    lea rdi, [salario]
    add rdi, 21
    mov byte [rdi], 0xA
    sub rdi, 3
    
    mov rcx, 2
    cvtsi2sd xmm2, rbx
    cvttsd2si r8, xmm0 
    cvtsi2sd xmm1, r8  
    subsd xmm0, xmm1
    
    int_to_string_decimal_part_next_digit:
    
        mulsd xmm0, xmm2
        cvttsd2si rax, xmm0  
        xor rdx, rdx
        div rbx
        add dl, '0'
        mov [rdi], dl 
        inc rdi

    loop int_to_string_decimal_part_next_digit
        
    sub rdi, 3
    mov byte[rdi], '.'   
    xor rax, rax
    mov rax, r8
       
    int_to_string_int_part_next_digit_loop:
    
        xor rdx, rdx
        div rbx
        add dl, '0'
        dec rdi
        mov byte[rdi], dl
        test rax, rax
             
    jnz int_to_string_int_part_next_digit_loop
        ret
