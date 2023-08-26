;----------------------------------
; double para string
;----------------------------------
; Entrada: double em xmm0
; Saida..: buffer (RDI)
; Precisão de casas decimais em RCX
;----------------------------------

double_to_string:

    ; Limpa os registradores xmm1, xmm2, rdi e r8 para garantir que estejam zerados
    pxor xmm1, xmm1
    pxor xmm2, xmm2
    xor rdi, rdi
    xor r8, r8

    ; Converte o valor double em xmm0 para um inteiro em r10
    cvttsd2si r10, xmm0
    ; Compara r10 com 0 para verificar se é negativo
    cmp r10, 0
    jl double_to_string_deny_number
    jmp continue

    double_to_string_deny_number:

        ; Prepara xmm3 com o valor de máscara de sinal
        pxor xmm3, xmm3
        movsd xmm3, [sign_mask]
        ; Aplica a máscara de sinal para inverter o sinal do número
        xorpd xmm0, xmm3

    continue:

        ; Carrega a base 10 em rbx
        mov rbx, 10
        ; Calcula o endereço da string de destino (buffer)
        lea rdi, [buffer]
        add rdi, 21
        ; Insere uma nova linha no final da string
        mov byte [rdi], 0xA
        sub rdi, 2

        ; Inicializa rcx com 1 (contador de dígitos)
        mov rcx, 1
        ; Converte a base 10 para um valor double em xmm2
        cvtsi2sd xmm2, rbx
        ; Converte o valor inteiro r8 em um double em xmm1
        cvttsd2si r8, xmm0
        cvtsi2sd xmm1, r8
        ; Subtrai a parte inteira do valor original
        subsd xmm0, xmm1

    int_to_string_decimal_part_next_digit:

        ; Multiplica o valor decimal atual por 10
        mulsd xmm0, xmm2
        ; Converte o valor para um inteiro rax
        cvttsd2si rax, xmm0
        xor rdx, rdx
        ; Divide o valor por 10 para obter o dígito atual
        div rbx
        add dl, '0'
        ; Armazena o dígito na string
        mov [rdi], dl
        inc rdi

    loop int_to_string_decimal_part_next_digit

    ; Volta duas posições na string e coloca o separador decimal '.'
    sub rdi, 2
    mov byte[rdi], '.'

    ; Reinicia o valor de rax e copia o valor de r8 (parte inteira) para rax
    xor rax, rax
    mov rax, r8

    int_to_string_int_part_next_digit_loop:

        ; Zera rdx para a divisão
        xor rdx, rdx
        ; Divide rax por 10
        div rbx
        ; Adiciona '0' ao resto para obter o dígito em ASCII
        add dl, '0'
        ; Decrementa rdi para armazenar o dígito na string
        dec rdi
        ; Armazena o dígito na string
        mov byte[rdi], dl
        ; Verifica se rax ainda possui dígitos
        test rax, rax
             
    jnz int_to_string_int_part_next_digit_loop

    ; Verifica se o número era negativo
    cmp r10, 0
    jl add_sign
    jmp double_to_string_done

    add_sign:

        ; Coloca o sinal de negativo na string
        dec rdi
        mov byte[rdi], '-'

double_to_string_done:
    ret
