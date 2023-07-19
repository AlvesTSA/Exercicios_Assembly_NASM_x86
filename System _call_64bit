; ---------------------------
; Número da chamada de sistema
; ---------------------------

SYS_EXIT      equ 60  ; Terminar o programa
SYS_READ      equ 0   ; Ler da entrada padrão
SYS_WRITE     equ 1   ; Escrever na saída padrão
SYS_OPEN      equ 2   ; Abrir um arquivo
SYS_CLOSE     equ 3   ; Fechar um arquivo
SYS_CREAT     equ 85  ; Criar um arquivo
SYS_LSEEK     equ 8   ; Mover o ponteiro de arquivo
SYS_EXECVE    equ 59  ; Executar um programa
SYS_FORK      equ 57  ; Criar um novo processo (clonar)
SYS_WAITPID   equ 61  ; Esperar que um processo termine
SYS_GETPID    equ 39  ; Obter o ID do processo atual
SYS_SOCKET    equ 41  ; Criar um socket
SYS_CONNECT   equ 42  ; Conectar a um socket
SYS_ACCEPT    equ 43  ; Aceitar uma conexão de socket
SYS_SEND      equ 44  ; Enviar dados através de um socket
SYS_RECV      equ 45  ; Receber dados através de um socket

; -------------------------
; Registradores utilizados
; -------------------------

rax   equ 0   ; Valor de retorno
rdi   equ 1   ; Argumento 1
rsi   equ 2   ; Argumento 2
rdx   equ 3   ; Argumento 3
r10   equ 4   ; Argumento 4
r8    equ 5   ; Argumento 5
r9    equ 6   ; Argumento 6

; -------------------
; Exemplo de chamada
; -------------------

section .data
    message db "Hello, World!",0Ah   ; Mensagem a ser escrita
    len equ $ - message             ; Tamanho da mensagem

section .text
    global _start

_start:
    ; Escrever na saída padrão
    mov rax, SYS_WRITE
    mov rdi, 1   ; Descritor de arquivo para saída padrão
    mov rsi, message
    mov rdx, len
    syscall

    ; Terminar o programa
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall
