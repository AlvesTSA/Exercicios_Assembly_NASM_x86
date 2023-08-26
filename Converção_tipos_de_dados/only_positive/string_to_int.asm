        ;----------------------------------
        ; string para inteiro
        ;----------------------------------
        ; Entrada: RSI (valor conv) RCX (tam)
        ; Saida..: RAX
        ;----------------------------------


        ; primeiramente precisamos conhecer o tamanho da string resultante, pois ate aqui não se sabe o tamanho, assim que o tamanho for conhecido, pode-se iniciar a conversão. O tamanho vamos descobrir com count_string_loop, onde rcx será responsável por contar os caracteres da string. Pronto, agora podemos iniciar a conversão com string_to_int_next_digit onde o tamanho da string resultante está em rcx que é usado com a instrução loop.

string_to_int: 

    xor rbx, rbx ; inicializa rbx com zero, usado posteriormente na multiplicação por dez e soma com rax
    
    ; Suponha que a string esteja armazenada em um buffer apontado por rsi
    
    xor rcx, rcx ; Inicializa rcx com zero, pois ainda não conhecemos o tamanho da string

    ; Vamos usar rdi para apontar para o início da string para manter o valor original de rsi
    mov rdi, rsi

    ; Enquanto o caractere atual não for o nulo ('\0'), continue contando o tamanho da string
    count_string_loop:

        movzx rax, byte [rsi] ; Carrega o próximo byte da string em rax
        test al, al           ; Verifica se o byte é nulo ('\0')
        jz count_string_loop_done          ; Se for nulo, termina o loop

        inc rcx               ; Incrementa o contador de tamanho da string
        inc rsi               ; Avança para o próximo caractere da string
        jmp count_string_loop        ; Repete o loop para o próximo caractere

    count_string_loop_done:
    ; Agora rcx contém o tamanho da string (sem contar o caractere nulo)
    ; Você pode usar rcx para o loop usando a instrução loop
        dec rcx ; while (--rcx) o loop irá ocorrer enqunato rcx for maior que zero
        
        ; Função: string_to_int_next_digit
        ; Descrição: Converte uma string de caracteres ASCII que representa um número inteiro em um valor inteiro de 64 bits (em RAX).

        string_to_int_next_digit:

            ; Carrega o byte atual apontado por RDI e expande para RAX, ignorando o restante dos bits preenchendo com zeros com a instrução movzx (move with zero-extend).
            movzx rax, byte [rdi]

            ; Incrementa o ponteiro RDI para apontar para o próximo caractere na string.
            inc rdi

            ; Subtrai o valor ASCII ('0') do valor em RAX para obter o dígito em formato numérico.
            sub al, '0'

            ; Multiplica o valor em RBX por 10 (0xA) e adiciona o valor em RAX.
            ; Isso atualiza o valor em RBX para ser rbx * 10 + rax.
            imul rbx, 0xA
            add rbx, rax ; rbx = rbx*10 + rax

            ; Repete o loop enquanto o registrador RCX não for zero (loop string_to_int_next_digit).
        loop string_to_int_next_digit  ; while (--rcx)

            ; Quando o loop terminar, o valor convertido estará em RBX.
            ; Mova o valor de RBX para RAX (registrador de retorno) antes de retornar da função.
            mov rax, rbx
            ret

