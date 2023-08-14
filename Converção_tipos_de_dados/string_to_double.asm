;----------------------------------
; string para double
;----------------------------------
; Entrada: string em RSI
; Saida..: valor de ponto flutuante em XMM0 (acumulador)
;----------------------------------

string_to_double:

    xor rax, rax            ; Zera o registrador RAX (usado para armazenar valores intermediários)
    pxor xmm0, xmm0         ; Zera o registrador de vetor xmm0 (usado para armazenar o resultado final)
    pxor xmm1, xmm1         ; Zera o registrador de vetor xmm1 (usado para armazenar valores intermediários)
    pxor xmm2, xmm2         ; Zera o registrador de vetor xmm2 (usado para armazenar valores intermediários)
    pxor xmm3, xmm3         ; Zera o registrador de vetor xmm3 (usado para armazenar o valor 10 como double)
    mov rbx, 10             ; Carrega o valor 10 em rbx (usado posteriormente para conversão de int para double)
    cvtsi2sd xmm3, rbx      ; Converte o valor inteiro em rbx para double e armazena em xmm3
    movsd xmm2, xmm3        ; Copia o valor de xmm3 para xmm2

    string_to_double_int_part_next_digit_loop:

        mov al, byte[rsi]    ; Carrega o próximo byte da string em al
        cmp al, '.'          ; Compara al com o caractere '.'
        je string_to_double_decimal_part_next_digit_loop ; Se for um '.', pula para a parte decimal da conversão
        
        sub al, '0'          ; Converte o caractere numérico em al para um valor numérico (0-9)
        cvtsi2sd xmm1, rax   ; Converte o valor numérico para double e armazena em xmm1
        mulsd xmm0, xmm3     ; Multiplica xmm0 pelo valor 10 (xmm3)
        addsd xmm0, xmm1     ; Adiciona xmm1 (dígito convertido) a xmm0
        inc rsi              ; Avança para o próximo caractere na string

    jmp string_to_double_int_part_next_digit_loop ; Retorna ao início do loop de conversão da parte inteira

    string_to_double_decimal_part_next_digit_loop:
    
        inc rsi              ; Avança para o próximo caractere na string
        mov al, byte[rsi]    ; Carrega o próximo byte da string em al
        cmp al, 0xA          ; Compara al com o caractere de nova linha (fim da string)
        je string_to_double_done ; Se for o fim da string, encerra a conversão
        
        sub al, '0'          ; Converte o caractere numérico em al para um valor numérico (0-9)
        cvtsi2sd xmm1, rax   ; Converte o valor numérico para double e armazena em xmm1
        divsd xmm1, xmm2     ; Divide xmm1 pelo valor 10 (xmm2)
        addsd xmm0, xmm1     ; Adiciona xmm1 (dígito convertido) a xmm0
        mulsd xmm2, xmm3     ; Multiplica xmm2 pelo valor 10 (xmm3)

        jmp string_to_double_decimal_part_next_digit_loop ; Retorna ao início do loop de conversão da parte decimal

string_to_double_done:
    ret                   ; Retorna ao chamador, a conversão está completa
