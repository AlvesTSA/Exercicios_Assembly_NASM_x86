;9. Faça um Programa que peça a temperatura em graus Fahrenheit, transforme e mostre a temperatura em graus Celsius. C = 5 * ((F-32) / 9).

section .data

    msg1 db "Informe a temperatura em Fahrenheit:",10,0
    len_msg1 equ $-msg1

    msg2 db "Temperatura em graus Celsius: ",0
    len_msg2 equ $-msg2

    msg3 db "°",10,0
    len_msg3 equ $-msg3

    sign_mask dq 0x8000000000000000

section .bss

    s_F resb 21
    s_C resb 21
    
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
    mov rsi, s_F
    mov rdx, 21
    syscall

    call string_to_double

    mov rax, 32
    mov rdi, 9
    mov rsi, 5
    cvtsi2sd xmm1, rax
    cvtsi2sd xmm2, rdi
    cvtsi2sd xmm3, rsi
    subsd xmm0, xmm1
    divsd xmm0, xmm2
    mulsd xmm0, xmm3
     
    call double_to_string

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len_msg2
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, s_C
    mov rdx, 21
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg3
    mov rdx, len_msg3
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

    mov dl, byte[rsi]
    cmp dl, '-'
    je skip_minus_sign
    jmp string_to_double_int_part_next_digit_loop

    skip_minus_sign:
        inc rsi
    
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

    cmp dl, '-'
    je string_to_double_deny_number
    jmp done

    string_to_double_deny_number:

        pxor xmm1, xmm1
        movsd xmm1, [sign_mask]
        xorpd xmm0, xmm1

    done:  
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

    cvttsd2si r10, xmm0
    cmp r10, 0
    jl double_to_string_deny_number
    jmp continue

    double_to_string_deny_number:

        pxor xmm3, xmm3
        movsd xmm3, [sign_mask]
        xorpd xmm0, xmm3

    continue:
    
        mov rbx, 10
        lea rdi, [s_C]
        add rdi, 21
        mov byte [rdi], 0xA
        sub rdi, 2
        
        mov rcx, 1
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
        
    sub rdi, 2
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

    cmp r10, 0
    jl add_sign
    jmp double_to_string_done

    add_sign:

        dec rdi
        mov byte[rdi], '-'

double_to_string_done:
    ret
