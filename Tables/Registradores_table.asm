+---------------------------------------+---------+---------------------------------------------------+
| Registrador           | Tamanho      |Descrição                                          |
+---------------------------------------+---------+---------------------------------------------------+
| AL / AX / EAX / RAX   | 8 / 16 / 32 / 64 bits | Acumulador geral (uso geral e retorno de funções) |
| BL / BX / EBX / RBX   | 8 / 16 / 32 / 64 bits | Base (ponteiro de dados)                         |
| CL / CX / ECX / RCX   | 8 / 16 / 32 / 64 bits |Contador                                          |
| DL / DX / EDX / RDX   | 8 / 16 / 32 / 64 bits | Dados                                            |
| SIL / SI / ESI / RSI  | 8 / 16 / 32 / 64 bits | Índice de origem (para operações com strings)     |
| DIL / DI / EDI / RDI  | 8 / 16 / 32 / 64 bits | Índice de destino (para operações com strings)   |
| BPL / BP / EBP / RBP  | 8 / 16 / 32 / 64 bits | Ponteiro de base (para acesso a argumentos e variáveis locais em funções) |
| SPL / SP / ESP / RSP  | 8 / 16 / 32 / 64 bits | Ponteiro de pilha (aponta para o topo da pilha)   |
| AH                    | 8 bits       | Parte alta do acumulador (AX)                    |
| BH                    | 8 bits       | Parte alta da base (BX)                          |
| CH                    | 8 bits       | Parte alta do contador (CX)                      |
| DH                    | 8 bits       | Parte alta dos dados (DX)                        |
| CS                    | 16 bits      | Segmento de código                               |
| DS                    | 16 bits      | Segmento de dados                                |
| SS                    | 16 bits      | Segmento de pilha                                |
| ES                    | 16 bits      | Segmento extra de dados                          |
| FS                    | 16 bits      | Segmento extra de dados (x86-64)                 |
| GS                    | 16 bits      | Segmento extra de dados (x86-64)                 |
| EFLAGS                | 32 bits      | Sinalizadores de controle e status               |
| IP / EIP / RIP        | 16 / 32 / 64 bits | Ponteiro de instrução (endereço da próxima instrução a ser executada) |
+---------------------------------------+---------+---------------------------------------------------+
