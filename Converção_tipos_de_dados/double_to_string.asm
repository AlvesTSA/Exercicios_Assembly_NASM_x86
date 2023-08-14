;----------------------------------
; double para string
;----------------------------------
; Entrada: double em xmm0
; Saida..: buffer (RDI)
; Precisão de casas decimais em RCX
;----------------------------------

double_to_string:

    pxor xmm1, xmm1         ; Zera o registrador de vetor xmm1 (usado para armazenar valores intermediários)
    pxor xmm2, xmm2         ; Zera o registrador de vetor xmm2 (usado para armazenar valores intermediários)
    xor rdi, rdi            ; Zera o registrador rdi (usado para apontar para a string de saída)
    xor r8, r8              ; Zera o registrador r8 (usado para armazenar valores intermediários)

    mov rbx, 10             ; Carrega o valor 10 em rbx (usado para realizar divisões)
    lea rdi, [buffer]      ; Carrega o endereço da string buffer em rdi
    add rdi, 0x11           ; Avança rdi para o final da parte inteira da string (antes do '\0')
    mov byte [rdi], 0xA     ; Coloca um caractere de nova linha ('\n') no final da string
    sub rdi, 3              ; Retrocede rdi para a posição após o ponto decimal

    mov rcx, 2              ; Configura rcx para controlar o número de iterações (2)
    cvtsi2sd xmm2, rbx      ; Converte o valor inteiro em rbx para double e armazena em xmm2
    cvttsd2si r8, xmm0      ; Converte xmm0 para um valor inteiro e armazena em r8
    cvtsi2sd xmm1, r8       ; Converte r8 de volta para double e armazena em xmm1
    subsd xmm0, xmm1        ; Subtrai xmm1 (parte inteira) de xmm0 (parte fracionária)

    int_to_string_decimal_part_next_digit:

        mulsd xmm0, xmm2     ; Multiplica xmm0 pela base (10)
        cvttsd2si rax, xmm0  ; Converte xmm0 para um valor inteiro e armazena em rax
        xor rdx, rdx         ; Zera rdx (usado para armazenar o resto da divisão)
        div rbx               ; Divide rax pelo valor 10 (rbx)
        add dl, '0'           ; Converte o valor numérico em dl para um caractere ASCII
        mov [rdi], dl         ; Armazena o caractere na string de saída
        inc rdi               ; Move o ponteiro para a próxima posição na string

    loop int_to_string_decimal_part_next_digit ; Loop para iterar sobre a parte decimal

    sub rdi, 3               ; Retrocede rdi para a posição após o ponto decimal
    mov byte[rdi], '.'      ; Coloca o caractere '.' para marcar o ponto decimal
    xor rax, rax            ; Zera rax
    mov rax, r8              ; Move o valor de r8 (parte inteira) para rax

    int_to_string_int_part_next_digit_loop:

        xor rdx, rdx         ; Zera rdx
        div rbx               ; Divide rax pelo valor 10 (rbx)
        add dl, '0'           ; Converte o valor numérico em dl para um caractere ASCII
        dec rdi               ; Retrocede o ponteiro na string
        mov byte[rdi], dl     ; Armazena o caractere na string
        test rax, rax         ; Testa se rax é zero

    jnz int_to_string_int_part_next_digit_loop ; Loop até rax se tornar zero
        ret                   ; Retorna ao chamador, a conversão está completa
