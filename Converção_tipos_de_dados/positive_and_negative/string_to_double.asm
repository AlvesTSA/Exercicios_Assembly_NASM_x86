;----------------------------------
; string para double
;----------------------------------
; Entrada: string em RSI
; Saida..: valor de ponto flutuante em XMM0 (acumulador)
;----------------------------------

string_to_double:

    ; Limpa os registradores para garantir que estão zerados
    xor rax, rax
    pxor xmm0, xmm0
    pxor xmm1, xmm1
    pxor xmm2, xmm2
    pxor xmm3, xmm3

    ; Carrega a base 10 para rbx e converte para um valor double em xmm3
    mov rbx, 10
    cvtsi2sd xmm3, rbx
    movsd xmm2, xmm3

    ; Carrega o primeiro byte da string
    mov dl, byte[rsi]
    ; Compara com '-' para verificar sinal negativo
    cmp dl, '-'
    je skip_minus_sign
    jmp string_to_double_int_part_next_digit_loop

    skip_minus_sign:
        inc rsi
    
    string_to_double_int_part_next_digit_loop:

        ; Carrega o próximo caractere da string
        mov al, byte[rsi]
        ; Compara com '.' para passar para a parte decimal
        cmp al, '.'
        je string_to_double_decimal_part_next_digit_loop
        
        ; Subtrai '0' para converter o caractere em um número inteiro
        sub al, '0'
        ; Converte o número inteiro para double e armazena em xmm1
        cvtsi2sd xmm1, rax
        ; Multiplica o acumulador atual (xmm0) pela base (xmm3) e adiciona o dígito convertido
        mulsd xmm0, xmm3
        addsd xmm0, xmm1
        ; Avança para o próximo caractere
        inc rsi
    jmp string_to_double_int_part_next_digit_loop
    
    string_to_double_decimal_part_next_digit_loop:
        
        ; Avança para o próximo caractere
        inc rsi
        ; Carrega o próximo caractere da string
        mov al, byte[rsi]
        ; Compara com 0xA (nova linha) para verificar o fim da string
        cmp al, 0xA
        je string_to_double_done

        ; Subtrai '0' para converter o caractere em um número inteiro
        sub al, '0'
        ; Converte o número inteiro para double e armazena em xmm1
        cvtsi2sd xmm1, rax
        ; Divide o valor pelo fator de base (xmm2) e adiciona ao acumulador (xmm0)
        divsd xmm1, xmm2
        addsd xmm0, xmm1
        ; Atualiza o fator de base multiplicando pelo fator de base original (xmm3)
        mulsd xmm2, xmm3
        
    jmp string_to_double_decimal_part_next_digit_loop

string_to_double_done:

    ; Verifica se o número era negativo
    cmp dl, '-'
    je string_to_double_deny_number
    jmp done

    string_to_double_deny_number:

        ; Aplica o sinal negativo
        pxor xmm1, xmm1
        movsd xmm1, [sign_mask]
        xorpd xmm0, xmm1

    done:  
        ; Retorna da função
        ret
