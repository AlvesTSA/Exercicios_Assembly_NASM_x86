        ;----------------------------------
        ; inteiro para string
        ;----------------------------------
        ; Entrada: inteiro em RAX
        ; Saida..: BUFFER (valor RSI) TAM_BUFFER (RDX)
        ;----------------------------------


int_to_string:

    ; Inicializa o ponteiro RSI para o endereço de destino da string (s_result).
    lea rsi, [s_result]

    ; Avança o ponteiro RSI para a posição onde o último caractere da string será armazenado (RSI + 0x15).
    add rsi, 0x15

    ; Armazena o caractere de nova linha ('\n' - 0x0A) no final da string.
    mov byte [rsi], 0x0A

    ; Configura o registrador RBX para 10 (0xA), que será usado para a divisão sucessiva.
    mov rbx, 0xA

    int_to_string_next_digit:

        ; Limpa o registrador RDX (resto da divisão).
        xor rdx, rdx

        ; Divide o valor em RAX por 10 (RBX) e armazena o resultado em RAX, o resto em RDX.
        div rbx

        ; Adiciona o valor ASCII ('0') ao resto da divisão (DL) para obter o dígito em formato ASCII.
        add dl, '0'

        ; Decrementa o ponteiro RSI para apontar para a próxima posição na string.
        dec rsi

        ; Armazena o dígito convertido em formato ASCII na posição atual apontada por RSI.
        mov [rsi], dl

        ; Testa se o valor em RAX é zero (divisão completa).
        ; Se não for zero, continua o loop para a próxima iteração.
        test rax, rax
        jnz int_to_string_next_digit

        ; Retorna da função.
        ret
