;13. Tendo como dado de entrada a altura (h) de uma pessoa, construa um algoritmo que calcule seu peso ideal, utilizando as seguintes fórmulas:

;Para homens: (72.7*h) - 58

;Para mulheres: (62.1*h) - 44.7

section .data

    msg1 db "Informe a sua altura: "
    len_msg1 equ $-msg1

    msg2 db "Peso ideal para homens:"
    len_msg2 equ $-msg2

    msg3 db "Peso ideal para mulheres:"
    len_msg3 equ $-msg3

    msg4 db " Kg"
    len_msg4 equ $-msg4

    next_line db 10

    sign_mask dq 0x8000000000000000

section .bss

    s_h resb 21
    s_p_ho resb 21
    s_p_mu resb 21

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
    mov rsi, s_h
    mov rdx, 21
    syscall

    call string_to_double

    ;(72.7*altura) - 58
    mov rax, 727
    mov rdi, 580
    mov rsi, 10
    cvtsi2sd xmm1, rax
    cvtsi2sd xmm2, rdi
    cvtsi2sd xmm3, rsi
    movsd xmm4, xmm0
    mulsd xmm4,xmm1
    subsd xmm4, xmm2
    divsd xmm4, xmm3
    
    call double_to_string_peso_homem

    ;(62.1*h) - 44.7
    mov rax, 621
    mov rdi, 447
    mov rsi, 10
    cvtsi2sd xmm1, rax
    cvtsi2sd xmm2, rdi
    cvtsi2sd xmm3, rsi
    movsd xmm4, xmm0
    mulsd xmm4,xmm1
    subsd xmm4, xmm2
    divsd xmm4, xmm3

    call double_to_string_peso_mulher

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len_msg2
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, next_line
    mov rdx, 1
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, s_p_ho
    mov rdx, 21
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg4
    mov rdx, len_msg4
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, next_line
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg3
    mov rdx, len_msg3
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, s_p_mu
    mov rdx, 21
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg4
    mov rdx, len_msg4
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
; Entrada: double em xmm4
; Saida..: buffer (RDI)
; Precisão de casas decimais em RCX
;----------------------------------

double_to_string_peso_homem:  

    pxor xmm1, xmm1
    pxor xmm2, xmm2
    xor rdi, rdi
    xor r8, r8

    mov rbx, 10
    lea rdi, [s_p_ho]
    add rdi, 21
    mov byte [rdi], 0xA
    sub rdi, 3
    
    mov rcx, 2
    cvtsi2sd xmm2, rbx
    cvttsd2si r8, xmm4 
    cvtsi2sd xmm1, r8  
    subsd xmm4, xmm1
    
    int_to_string_decimal_part_next_digit_peso_homem:
    
        mulsd xmm4, xmm2
        cvttsd2si rax, xmm4  
        xor rdx, rdx
        div rbx
        add dl, '0'
        mov [rdi], dl 
        inc rdi

    loop int_to_string_decimal_part_next_digit_peso_homem
        
    sub rdi, 3
    mov byte[rdi], '.'   
    xor rax, rax
    mov rax, r8
       
    int_to_string_int_part_next_digit_loop_peso_homem:
    
        xor rdx, rdx
        div rbx
        add dl, '0'
        dec rdi
        mov byte[rdi], dl
        test rax, rax
             
    jnz int_to_string_int_part_next_digit_loop_peso_homem
        ret


double_to_string_peso_mulher:  

    pxor xmm1, xmm1
    pxor xmm2, xmm2
    xor rdi, rdi
    xor r8, r8

    mov rbx, 10
    lea rdi, [s_p_mu]
    add rdi, 21
    mov byte [rdi], 0xA
    sub rdi, 3
    
    mov rcx, 2
    cvtsi2sd xmm2, rbx
    cvttsd2si r8, xmm4 
    cvtsi2sd xmm1, r8  
    subsd xmm4, xmm1
    
    int_to_string_decimal_part_next_digit_peso_mulher:
    
        mulsd xmm4, xmm2
        cvttsd2si rax, xmm4  
        xor rdx, rdx
        div rbx
        add dl, '0'
        mov [rdi], dl 
        inc rdi

    loop int_to_string_decimal_part_next_digit_peso_mulher
        
    sub rdi, 3
    mov byte[rdi], '.'   
    xor rax, rax
    mov rax, r8
       
    int_to_string_int_part_next_digit_loop_peso_mulher:
    
        xor rdx, rdx
        div rbx
        add dl, '0'
        dec rdi
        mov byte[rdi], dl
        test rax, rax
             
    jnz int_to_string_int_part_next_digit_loop_peso_mulher
        ret


        ; nasm -f elf64 exercicio013.asm -o exercicio013.o && ld exercicio013.o -o exercicio013 && ./exercicio013

