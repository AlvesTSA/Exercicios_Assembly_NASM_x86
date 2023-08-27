;11. Faça um Programa que peça 2 números inteiros e um número real. Calcule e mostre:

;a) o produto do dobro do primeiro com metade do segundo .

;b) a soma do triplo do primeiro com o terceiro.

;c) o terceiro elevado ao cubo.

section .data

    msg1 db "Informe dois números inteiros e um número real respectivamente, ambos no formato 0.0:",10,0
    len_msg1 equ $-msg1

    msg2 db "O produto do dobro do primeiro com metade do segundo:",10
    len_msg2 equ $-msg2

    msg3 db "A soma do triplo do primeiro com o terceiro:"
    len_msg3 equ $-msg3

    msg4 db "O terceiro elevado ao cubo:"
    len_msg4 equ $-msg4

    next_line db 10

    sign_mask dq 0x8000000000000000

section .bss

    s_num1 resb 21
    s_num2 resb 21
    s_num3 resb 21

    d_num1 resq 1
    d_num2 resq 1
    d_num3 resq 1

    s_result1 resb 21
    s_result2 resb 21
    s_result3 resb 21

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

    call string_to_double
    movsd [d_num1], xmm0

    mov rax, 0
    mov rdi, 0
    mov rsi, s_num2
    mov rdx, 21
    syscall

    call string_to_double
    movsd [d_num2], xmm0

    mov rax, 0
    mov rdi, 0
    mov rsi, s_num3
    mov rdx, 21
    syscall

    call string_to_double
    movsd [d_num3], xmm0

    ;a) o produto do dobro do primeiro com metade do segundo.
    ;(2*primeiro)*(segundo/2)

    mov rax, 2
    pxor xmm0, xmm0
    cvtsi2sd xmm0, rax
    cvtsi2sd xmm1, rax
    mulsd xmm0, [d_num1]
    movsd xmm2, [d_num2]
    divsd xmm2, xmm1
    mulsd xmm0, xmm2

    call double_to_string_1

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len_msg2
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, s_result1
    mov rdx, 21
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, next_line
    mov rdx, 1
    syscall

    ;b) a soma do triplo do primeiro com o terceiro.
    ;(3*primeiro)+terceiro

    mov rax, 3
    pxor xmm0, xmm0
    cvtsi2sd xmm0, rax
    mulsd xmm0, [d_num1]
    addsd xmm0, [d_num3]
    
    call double_to_string_2

    mov rax, 1
    mov rdi, 1
    mov rsi, msg3
    mov rdx, len_msg3
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, s_result2
    mov rdx, 21
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, next_line
    mov rdx, 1
    syscall

    ;c) o terceiro elevado ao cubo.;terceiro*terceiro*terceiro
        
    pxor xmm0, xmm0
    movsd xmm0, [d_num3]
    mulsd xmm0, [d_num3]
    mulsd xmm0, [d_num3]
    
    call double_to_string_3

    mov rax, 1
    mov rdi, 1
    mov rsi, msg4
    mov rdx, len_msg4
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, s_result3
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

double_to_string_1:  

    pxor xmm1, xmm1
    pxor xmm2, xmm2
    xor rdi, rdi
    xor r8, r8

    cvttsd2si r10, xmm0
    cmp r10, 0
    jl double_to_string_deny_number_1
    jmp continue_1

    double_to_string_deny_number_1:

        pxor xmm3, xmm3
        movsd xmm3, [sign_mask]
        xorpd xmm0, xmm3

    continue_1:
    
        mov rbx, 10
        lea rdi, [s_result1]
        add rdi, 21
        mov byte [rdi], 0xA
        sub rdi, 2
        
        mov rcx, 1
        cvtsi2sd xmm2, rbx
        cvttsd2si r8, xmm0 
        cvtsi2sd xmm1, r8  
        subsd xmm0, xmm1
    
    int_to_string_decimal_part_next_digit_1:
    
        mulsd xmm0, xmm2
        cvttsd2si rax, xmm0  
        xor rdx, rdx
        div rbx
        add dl, '0'
        mov [rdi], dl 
        inc rdi

    loop int_to_string_decimal_part_next_digit_1
        
    sub rdi, 2
    mov byte[rdi], '.'   
    xor rax, rax
    mov rax, r8
       
    int_to_string_int_part_next_digit_loop_1:
    
        xor rdx, rdx
        div rbx
        add dl, '0'
        dec rdi
        mov byte[rdi], dl
        test rax, rax
             
    jnz int_to_string_int_part_next_digit_loop_1

    cmp r10, 0
    jl add_sign_1
    jmp double_to_string_done_1

    add_sign_1:

        dec rdi
        mov byte[rdi], '-'

double_to_string_done_1:
    ret

double_to_string_2:  

    pxor xmm1, xmm1
    pxor xmm2, xmm2
    xor rdi, rdi
    xor r8, r8

    cvttsd2si r10, xmm0
    cmp r10, 0
    jl double_to_string_deny_number_2
    jmp continue_2

    double_to_string_deny_number_2:

        pxor xmm3, xmm3
        movsd xmm3, [sign_mask]
        xorpd xmm0, xmm3

    continue_2:
    
        mov rbx, 10
        lea rdi, [s_result2]
        add rdi, 21
        mov byte [rdi], 0xA
        sub rdi, 2
        
        mov rcx, 1
        cvtsi2sd xmm2, rbx
        cvttsd2si r8, xmm0 
        cvtsi2sd xmm1, r8  
        subsd xmm0, xmm1
    
    int_to_string_decimal_part_next_digit_2:
    
        mulsd xmm0, xmm2
        cvttsd2si rax, xmm0  
        xor rdx, rdx
        div rbx
        add dl, '0'
        mov [rdi], dl 
        inc rdi

    loop int_to_string_decimal_part_next_digit_2
        
    sub rdi, 2
    mov byte[rdi], '.'   
    xor rax, rax
    mov rax, r8
       
    int_to_string_int_part_next_digit_loop_2:
    
        xor rdx, rdx
        div rbx
        add dl, '0'
        dec rdi
        mov byte[rdi], dl
        test rax, rax
             
    jnz int_to_string_int_part_next_digit_loop_2

    cmp r10, 0
    jl add_sign_2
    jmp double_to_string_done_2

    add_sign_2:

        dec rdi
        mov byte[rdi], '-'

double_to_string_done_2:
    ret


double_to_string_3:  

    pxor xmm1, xmm1
    pxor xmm2, xmm2
    xor rdi, rdi
    xor r8, r8

    cvttsd2si r10, xmm0
    cmp r10, 0
    jl double_to_string_deny_number_3
    jmp continue_3

    double_to_string_deny_number_3:

        pxor xmm3, xmm3
        movsd xmm3, [sign_mask]
        xorpd xmm0, xmm3

    continue_3:
    
        mov rbx, 10
        lea rdi, [s_result3]
        add rdi, 21
        mov byte [rdi], 0xA
        sub rdi, 2
        
        mov rcx, 1
        cvtsi2sd xmm2, rbx
        cvttsd2si r8, xmm0 
        cvtsi2sd xmm1, r8  
        subsd xmm0, xmm1
    
    int_to_string_decimal_part_next_digit_3:
    
        mulsd xmm0, xmm2
        cvttsd2si rax, xmm0  
        xor rdx, rdx
        div rbx
        add dl, '0'
        mov [rdi], dl 
        inc rdi

    loop int_to_string_decimal_part_next_digit_3
        
    sub rdi, 2
    mov byte[rdi], '.'   
    xor rax, rax
    mov rax, r8
       
    int_to_string_int_part_next_digit_loop_3:
    
        xor rdx, rdx
        div rbx
        add dl, '0'
        dec rdi
        mov byte[rdi], dl
        test rax, rax
             
    jnz int_to_string_int_part_next_digit_loop_3

    cmp r10, 0
    jl add_sign_3
    jmp double_to_string_done_3

    add_sign_3:

        dec rdi
        mov byte[rdi], '-'

double_to_string_done_3:
    ret
       


