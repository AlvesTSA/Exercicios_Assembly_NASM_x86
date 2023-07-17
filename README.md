# Exercicios_Assembly_NASM_x86


<div align="center">
<img src="https://github.com/AlvesTSA/Exercicios_C/assets/116441568/76cabc83-fed6-4f20-860c-691a1e8e74af" width="75px" />
<img src="https://github.com/AlvesTSA/Exercicios_C/assets/116441568/7508fe95-48b1-416e-b97d-aa1db84086c7" width="110px" />
</div>

<h1 align="center">Conhecendo e treinando Assembly</h1>

<p align="justify">Esses exercícios são genéricos e podem ser resolvidos em qualquer linguagem que você preferir, apenas tome cuidado e os adapte a medida que você percebe as limitações de cada linguagem.</p>
<p align="center">
  💼 Skills: <strong>pré-requisito para resolver os exercícios sobre estrutura sequencial.</strong>
</p>

<p align="justify">
<strong>  a)</strong> Familiaridade com a arquitetura do processador: Assembly é uma linguagem de baixo nível que se aproxima das instruções do processador subjacente. Portanto, você precisa estar familiarizado com a arquitetura do processador específico em que deseja programar. Por exemplo, x86, ARM, MIPS, etc. É necessário saber sobre registradores, modos de endereçamento e instruções específicas da arquitetura.
</p>
<p align="justify">
<strong>  b)</strong> Como declarar variáveis:
Em assembly, as variáveis são representadas por registradores ou posições de memória. Antes de usar uma variável, é necessário declará-la reservando espaço na memória. O processo de reserva de memória pode variar dependendo da arquitetura específica. Por exemplo, em x86, você pode usar a instrução "MOV" para reservar espaço na pilha para uma variável.


</p>
<p align="justify">
<strong>  c)</strong>  Como atribuir valores para variáveis:
Para atribuir valores a variáveis em assembly, você usa a instrução apropriada para mover um valor para o registrador ou posição de memória associada à variável. Por exemplo, para atribuir o valor 42 a uma variável, você usaria a instrução "MOV" para mover o valor para a localização da variável.
</p>
<p align="justify">
 <strong> d)</strong>Como funcionam os tipos de dados de cada variável:
Em assembly, os tipos de dados são tratados de forma mais genérica, geralmente sendo representados como sequências de bits. Por exemplo, um valor inteiro pode ser armazenado em um registrador ou em uma posição de memória como um conjunto de bits. Não há suporte direto para tipos de dados complexos, como strings, em assembly. Em vez disso, strings são tratadas como sequências de caracteres individuais.
</p>
<p align="justify">
 <strong> e)</strong> Como realizar a entrada de dados usando o teclado:
A entrada de dados em assembly geralmente envolve chamadas a funções de sistema operacional ou interrupções para receber entrada do teclado. Cada sistema operacional possui sua própria maneira de lidar com a entrada. Você precisará consultar a documentação específica do sistema operacional e da arquitetura que está usando para aprender como realizar a entrada de dados usando o teclado em assembly.
</p>
<p align="justify">
 <strong> f)</strong>  Como realizar a saída de dados usando o terminal:
A saída de dados em assembly também envolve chamadas a funções de sistema operacional ou interrupções para exibir informações no terminal. Assim como na entrada de dados, a maneira de realizar a saída varia de acordo com o sistema operacional e a arquitetura. Consulte a documentação relevante para aprender como realizar a saída de dados no terminal em assembly.
</p>

<p align="justify">
 <strong> g)</strong> Como realizar operações matemáticas:
As operações matemáticas em assembly são realizadas usando instruções específicas da arquitetura. Por exemplo, para adição, você usaria uma instrução "ADD" para somar dois valores armazenados em registradores. Para subtração, seria usada a instrução "SUB". As operações matemáticas em assembly são geralmente realizadas em registradores, embora também seja possível operar diretamente em posições de memória. É importante estar familiarizado com as instruções e os modos de endereçamento da arquitetura específica que você está usando.
</p>
<p>Caso você não conheça algum desses assuntos, pare um pouco e dê uma revisada no conteúdo antes de prosseguir.</p>

<h3>Regras</h3>

<p>Construa um programa para cada exercício a seguir;</p>
<p>A interpretação do exercício e como resolve-lo faz parte do exercício;</p>
<p>Você poderá utilizar IDE’s de programação de seu interesse, mas lembre-se, o risco de se acomodar com as comodidades da IDE é seu;</p>

<details>
<summary align = "center"> 
<h2 align = "center">LINUX SYSTEM CALL TABLE FOR X86 64bit</h2>
</summary>

<table border>




<tr><th align="center">%rax</th><th align="center">System call</th><th align="center">%rdi</th><th align="center">%rsi</th><th align="center">%rdx</th><th align="center">%r10</th><th align="center">%r8</th><th align="center">%r9</th></tr>






<tr><td>0</td><td>sys_read</td><td>unsigned int fd</td><td>char *buf</td><td>size_t count</td><td></td><td></td><td></td></tr>


<tr><td>1</td><td>sys_write</td><td>unsigned int fd</td><td>const char *buf</td><td>size_t count</td><td></td><td></td><td></td></tr>


<tr><td>2</td><td>sys_open</td><td>const char *filename</td><td>int flags</td><td>int mode</td><td></td><td></td><td></td></tr>


<tr><td>3</td><td>sys_close</td><td>unsigned int fd</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>4</td><td>sys_stat</td><td>const char *filename</td><td>struct stat *statbuf</td><td></td><td></td><td></td><td></td></tr>


<tr><td>5</td><td>sys_fstat</td><td>unsigned int fd</td><td>struct stat *statbuf</td><td></td><td></td><td></td><td></td></tr>


<tr><td>6</td><td>sys_lstat</td><td>fconst char *filename</td><td>struct stat *statbuf</td><td></td><td></td><td></td><td></td></tr>


<tr><td>7</td><td>sys_poll</td><td>struct poll_fd *ufds</td><td>unsigned int nfds</td><td>long timeout_msecs</td><td></td><td></td><td></td></tr>


<tr><td>8</td><td>sys_lseek</td><td>unsigned int fd</td><td>off_t offset</td><td>unsigned int origin</td><td></td><td></td><td></td></tr>


<tr><td>9</td><td>sys_mmap</td><td>unsigned long addr</td><td>unsigned long len</td><td>unsigned long prot</td><td>unsigned long flags</td><td>unsigned long fd</td><td>unsigned long off</td></tr>


<tr><td>10</td><td>sys_mprotect</td><td>unsigned long start</td><td>size_t len</td><td>unsigned long prot</td><td></td><td></td><td></td></tr>


<tr><td>11</td><td>sys_munmap</td><td>unsigned long addr</td><td>size_t len</td><td></td><td></td><td></td><td></td></tr>


<tr><td>12</td><td>sys_brk</td><td>unsigned long brk</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>13</td><td>sys_rt_sigaction</td><td>int sig</td><td>const struct sigaction *act</td><td>struct sigaction *oact</td><td>size_t sigsetsize</td><td></td><td></td></tr>


<tr><td>14</td><td>sys_rt_sigprocmask</td><td>int how</td><td>sigset_t *nset</td><td>sigset_t *oset</td><td>size_t sigsetsize</td><td></td><td></td></tr>


<tr><td>15</td><td>sys_rt_sigreturn</td><td>unsigned long __unused</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>16</td><td>sys_ioctl</td><td>unsigned int fd</td><td>unsigned int cmd</td><td>unsigned long arg</td><td></td><td></td><td></td></tr>


<tr><td>17</td><td>sys_pread64</td><td>unsigned long fd</td><td>char *buf</td><td>size_t count</td><td>loff_t pos</td><td></td><td></td></tr>


<tr><td>18</td><td>sys_pwrite64</td><td>unsigned int fd</td><td>const char *buf</td><td>size_t count</td><td>loff_t pos</td><td></td><td></td></tr>


<tr><td>19</td><td>sys_readv</td><td>unsigned long fd</td><td>const struct iovec *vec</td><td>unsigned long vlen</td><td></td><td></td><td></td></tr>


<tr><td>20</td><td>sys_writev</td><td>unsigned long fd</td><td>const struct iovec *vec</td><td>unsigned long vlen</td><td></td><td></td><td></td></tr>


<tr><td>21</td><td>sys_access</td><td>const char *filename</td><td>int mode</td><td></td><td></td><td></td><td></td></tr>


<tr><td>22</td><td>sys_pipe</td><td>int *filedes</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>23</td><td>sys_select</td><td>int n</td><td>fd_set *inp</td><td>fd_set *outp</td><td>fd_set*exp</td><td>struct timeval *tvp</td><td></td></tr>


<tr><td>24</td><td>sys_sched_yield</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>25</td><td>sys_mremap</td><td>unsigned long addr</td><td>unsigned long old_len</td><td>unsigned long new_len</td><td>unsigned long flags</td><td>unsigned long new_addr</td><td></td></tr>


<tr><td>26</td><td>sys_msync</td><td>unsigned long start</td><td>size_t len</td><td>int flags</td><td></td><td></td><td></td></tr>


<tr><td>27</td><td>sys_mincore</td><td>unsigned long start</td><td>size_t len</td><td>unsigned char *vec</td><td></td><td></td><td></td></tr>


<tr><td>28</td><td>sys_madvise</td><td>unsigned long start</td><td>size_t len_in</td><td>int behavior</td><td></td><td></td><td></td></tr>


<tr><td>29</td><td>sys_shmget</td><td>key_t key</td><td>size_t size</td><td>int shmflg</td><td></td><td></td><td></td></tr>


<tr><td>30</td><td>sys_shmat</td><td>int shmid</td><td>char *shmaddr</td><td>int shmflg</td><td></td><td></td><td></td></tr>


<tr><td>31</td><td>sys_shmctl</td><td>int shmid</td><td>int cmd</td><td>struct shmid_ds *buf</td><td></td><td></td><td></td></tr>


<tr><td>32</td><td>sys_dup</td><td>unsigned int fildes</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>33</td><td>sys_dup2</td><td>unsigned int oldfd</td><td>unsigned int newfd</td><td></td><td></td><td></td><td></td></tr>


<tr><td>34</td><td>sys_pause</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>35</td><td>sys_nanosleep</td><td>struct timespec *rqtp</td><td>struct timespec *rmtp</td><td></td><td></td><td></td><td></td></tr>


<tr><td>36</td><td>sys_getitimer</td><td>int which</td><td>struct itimerval *value</td><td></td><td></td><td></td><td></td></tr>


<tr><td>37</td><td>sys_alarm</td><td>unsigned int seconds</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>38</td><td>sys_setitimer</td><td>int which</td><td>struct itimerval *value</td><td>struct itimerval *ovalue</td><td></td><td></td><td></td></tr>


<tr><td>39</td><td>sys_getpid</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>40</td><td>sys_sendfile</td><td>int out_fd</td><td>int in_fd</td><td>off_t *offset</td><td>size_t count</td><td></td><td></td></tr>


<tr><td>41</td><td>sys_socket</td><td>int family</td><td>int type</td><td>int protocol</td><td></td><td></td><td></td></tr>


<tr><td>42</td><td>sys_connect</td><td>int fd</td><td>struct sockaddr *uservaddr</td><td>int addrlen</td><td></td><td></td><td></td></tr>


<tr><td>43</td><td>sys_accept</td><td>int fd</td><td>struct sockaddr *upeer_sockaddr</td><td>int *upeer_addrlen</td><td></td><td></td><td></td></tr>


<tr><td>44</td><td>sys_sendto</td><td>int fd</td><td>void *buff</td><td>size_t len</td><td>unsigned flags</td><td>struct sockaddr *addr</td><td>int addr_len</td></tr>


<tr><td>45</td><td>sys_recvfrom</td><td>int fd</td><td>void *ubuf</td><td>size_t size</td><td>unsigned flags</td><td>struct sockaddr *addr</td><td>int *addr_len</td></tr>


<tr><td>46</td><td>sys_sendmsg</td><td>int fd</td><td>struct msghdr *msg</td><td>unsigned flags</td><td></td><td></td><td></td></tr>


<tr><td>47</td><td>sys_recvmsg</td><td>int fd</td><td>struct msghdr *msg</td><td>unsigned int flags</td><td></td><td></td><td></td></tr>


<tr><td>48</td><td>sys_shutdown</td><td>int fd</td><td>int how</td><td></td><td></td><td></td><td></td></tr>


<tr><td>49</td><td>sys_bind</td><td>int fd</td><td>struct sokaddr *umyaddr</td><td>int addrlen</td><td></td><td></td><td></td></tr>


<tr><td>50</td><td>sys_listen</td><td>int fd</td><td>int backlog</td><td></td><td></td><td></td><td></td></tr>


<tr><td>51</td><td>sys_getsockname</td><td>int fd</td><td>struct sockaddr *usockaddr</td><td>int *usockaddr_len</td><td></td><td></td><td></td></tr>


<tr><td>52</td><td>sys_getpeername</td><td>int fd</td><td>struct sockaddr *usockaddr</td><td>int *usockaddr_len</td><td></td><td></td><td></td></tr>


<tr><td>53</td><td>sys_socketpair</td><td>int family</td><td>int type</td><td>int protocol</td><td>int *usockvec</td><td></td><td></td></tr>


<tr><td>54</td><td>sys_setsockopt</td><td>int fd</td><td>int level</td><td>int optname</td><td>char *optval</td><td>int optlen</td><td></td></tr>


<tr><td>55</td><td>sys_getsockopt</td><td>int fd</td><td>int level</td><td>int optname</td><td>char *optval</td><td>int *optlen</td><td></td></tr>


<tr><td>56</td><td>sys_clone</td><td>unsigned long clone_flags</td><td>unsigned long newsp</td><td>void *parent_tid</td><td>void *child_tid</td><td>unsigned int tid</td><td></td></tr>


<tr><td>57</td><td>sys_fork</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>58</td><td>sys_vfork</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>59</td><td>sys_execve</td><td>const char *filename</td><td>const char *const argv[]</td><td>const char *const envp[]</td><td></td><td></td><td></td></tr>


<tr><td>60</td><td>sys_exit</td><td>int error_code</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>61</td><td>sys_wait4</td><td>pid_t upid</td><td>int *stat_addr</td><td>int options</td><td>struct rusage *ru</td><td></td><td></td></tr>


<tr><td>62</td><td>sys_kill</td><td>pid_t pid</td><td>int sig</td><td></td><td></td><td></td><td></td></tr>


<tr><td>63</td><td>sys_uname</td><td>struct old_utsname *name</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>64</td><td>sys_semget</td><td>key_t key</td><td>int nsems</td><td>int semflg</td><td></td><td></td><td></td></tr>


<tr><td>65</td><td>sys_semop</td><td>int semid</td><td>struct sembuf *tsops</td><td>unsigned nsops</td><td></td><td></td><td></td></tr>


<tr><td>66</td><td>sys_semctl</td><td>int semid</td><td>int semnum</td><td>int cmd</td><td>union semun arg</td><td></td><td></td></tr>


<tr><td>67</td><td>sys_shmdt</td><td>char *shmaddr</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>68</td><td>sys_msgget</td><td>key_t key</td><td>int msgflg</td><td></td><td></td><td></td><td></td></tr>


<tr><td>69</td><td>sys_msgsnd</td><td>int msqid</td><td>struct msgbuf *msgp</td><td>size_t msgsz</td><td>int msgflg</td><td></td><td></td></tr>


<tr><td>70</td><td>sys_msgrcv</td><td>int msqid</td><td>struct msgbuf *msgp</td><td>size_t msgsz</td><td>long msgtyp</td><td>int msgflg</td><td></td></tr>


<tr><td>71</td><td>sys_msgctl</td><td>int msqid</td><td>int cmd</td><td>struct msqid_ds *buf</td><td></td><td></td><td></td></tr>


<tr><td>72</td><td>sys_fcntl</td><td>unsigned int fd</td><td>unsigned int cmd</td><td>unsigned long arg</td><td></td><td></td><td></td></tr>


<tr><td>73</td><td>sys_flock</td><td>unsigned int fd</td><td>unsigned int cmd</td><td></td><td></td><td></td><td></td></tr>


<tr><td>74</td><td>sys_fsync</td><td>unsigned int fd</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>75</td><td>sys_fdatasync</td><td>unsigned int fd</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>76</td><td>sys_truncate</td><td>const char *path</td><td>long length</td><td></td><td></td><td></td><td></td></tr>


<tr><td>77</td><td>sys_ftruncate</td><td>unsigned int fd</td><td>unsigned long length</td><td></td><td></td><td></td><td></td></tr>


<tr><td>78</td><td>sys_getdents</td><td>unsigned int fd</td><td>struct linux_dirent *dirent</td><td>unsigned int count</td><td></td><td></td><td></td></tr>


<tr><td>79</td><td>sys_getcwd</td><td>char *buf</td><td>unsigned long size</td><td></td><td></td><td></td><td></td></tr>


<tr><td>80</td><td>sys_chdir</td><td>const char *filename</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>81</td><td>sys_fchdir</td><td>unsigned int fd</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>82</td><td>sys_rename</td><td>const char *oldname</td><td>const char *newname</td><td></td><td></td><td></td><td></td></tr>


<tr><td>83</td><td>sys_mkdir</td><td>const char *pathname</td><td>int mode</td><td></td><td></td><td></td><td></td></tr>


<tr><td>84</td><td>sys_rmdir</td><td>const char *pathname</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>85</td><td>sys_creat</td><td>const char *pathname</td><td>int mode</td><td></td><td></td><td></td><td></td></tr>


<tr><td>86</td><td>sys_link</td><td>const char *oldname</td><td>const char *newname</td><td></td><td></td><td></td><td></td></tr>


<tr><td>87</td><td>sys_unlink</td><td>const char *pathname</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>88</td><td>sys_symlink</td><td>const char *oldname</td><td>const char *newname</td><td></td><td></td><td></td><td></td></tr>


<tr><td>89</td><td>sys_readlink</td><td>const char *path</td><td>char *buf</td><td>int bufsiz</td><td></td><td></td><td></td></tr>


<tr><td>90</td><td>sys_chmod</td><td>const char *filename</td><td>mode_t mode</td><td></td><td></td><td></td><td></td></tr>


<tr><td>91</td><td>sys_fchmod</td><td>unsigned int fd</td><td>mode_t mode</td><td></td><td></td><td></td><td></td></tr>


<tr><td>92</td><td>sys_chown</td><td>const char *filename</td><td>uid_t user</td><td>gid_t group</td><td></td><td></td><td></td></tr>


<tr><td>93</td><td>sys_fchown</td><td>unsigned int fd</td><td>uid_t user</td><td>gid_t group</td><td></td><td></td><td></td></tr>


<tr><td>94</td><td>sys_lchown</td><td>const char *filename</td><td>uid_t user</td><td>gid_t group</td><td></td><td></td><td></td></tr>


<tr><td>95</td><td>sys_umask</td><td>int mask</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>96</td><td>sys_gettimeofday</td><td>struct timeval *tv</td><td>struct timezone *tz</td><td></td><td></td><td></td><td></td></tr>


<tr><td>97</td><td>sys_getrlimit</td><td>unsigned int resource</td><td>struct rlimit *rlim</td><td></td><td></td><td></td><td></td></tr>


<tr><td>98</td><td>sys_getrusage</td><td>int who</td><td>struct rusage *ru</td><td></td><td></td><td></td><td></td></tr>


<tr><td>99</td><td>sys_sysinfo</td><td>struct sysinfo *info</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>100</td><td>sys_times</td><td>struct tms *tbuf</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>101</td><td>sys_ptrace</td><td>long request</td><td>long pid</td><td>unsigned long addr</td><td>unsigned long data</td><td></td><td></td></tr>


<tr><td>102</td><td>sys_getuid</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>103</td><td>sys_syslog</td><td>int type</td><td>char *buf</td><td>int len</td><td></td><td></td><td></td></tr>


<tr><td>104</td><td>sys_getgid</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>105</td><td>sys_setuid</td><td>uid_t uid</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>106</td><td>sys_setgid</td><td>gid_t gid</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>107</td><td>sys_geteuid</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>108</td><td>sys_getegid</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>109</td><td>sys_setpgid</td><td>pid_t pid</td><td>pid_t pgid</td><td></td><td></td><td></td><td></td></tr>


<tr><td>110</td><td>sys_getppid</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>111</td><td>sys_getpgrp</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>112</td><td>sys_setsid</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>113</td><td>sys_setreuid</td><td>uid_t ruid</td><td>uid_t euid</td><td></td><td></td><td></td><td></td></tr>


<tr><td>114</td><td>sys_setregid</td><td>gid_t rgid</td><td>gid_t egid</td><td></td><td></td><td></td><td></td></tr>


<tr><td>115</td><td>sys_getgroups</td><td>int gidsetsize</td><td>gid_t *grouplist</td><td></td><td></td><td></td><td></td></tr>


<tr><td>116</td><td>sys_setgroups</td><td>int gidsetsize</td><td>gid_t *grouplist</td><td></td><td></td><td></td><td></td></tr>


<tr><td>117</td><td>sys_setresuid</td><td>uid_t *ruid</td><td>uid_t *euid</td><td>uid_t *suid</td><td></td><td></td><td></td></tr>


<tr><td>118</td><td>sys_getresuid</td><td>uid_t *ruid</td><td>uid_t *euid</td><td>uid_t *suid</td><td></td><td></td><td></td></tr>


<tr><td>119</td><td>sys_setresgid</td><td>gid_t rgid</td><td>gid_t egid</td><td>gid_t sgid</td><td></td><td></td><td></td></tr>


<tr><td>120</td><td>sys_getresgid</td><td>gid_t *rgid</td><td>gid_t *egid</td><td>gid_t *sgid</td><td></td><td></td><td></td></tr>


<tr><td>121</td><td>sys_getpgid</td><td>pid_t pid</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>122</td><td>sys_setfsuid</td><td>uid_t uid</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>123</td><td>sys_setfsgid</td><td>gid_t gid</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>124</td><td>sys_getsid</td><td>pid_t pid</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>125</td><td>sys_capget</td><td>cap_user_header_t header</td><td>cap_user_data_t dataptr</td><td></td><td></td><td></td><td></td></tr>


<tr><td>126</td><td>sys_capset</td><td>cap_user_header_t header</td><td>const cap_user_data_t data</td><td></td><td></td><td></td><td></td></tr>


<tr><td>127</td><td>sys_rt_sigpending</td><td>sigset_t *set</td><td>size_t sigsetsize</td><td></td><td></td><td></td><td></td></tr>


<tr><td>128</td><td>sys_rt_sigtimedwait</td><td>const sigset_t *uthese</td><td>siginfo_t *uinfo</td><td>const struct timespec *uts</td><td>size_t sigsetsize</td><td></td><td></td></tr>


<tr><td>129</td><td>sys_rt_sigqueueinfo</td><td>pid_t pid</td><td>int sig</td><td>siginfo_t *uinfo</td><td></td><td></td><td></td></tr>


<tr><td>130</td><td>sys_rt_sigsuspend</td><td>sigset_t *unewset</td><td>size_t sigsetsize</td><td></td><td></td><td></td><td></td></tr>


<tr><td>131</td><td>sys_sigaltstack</td><td>const stack_t *uss</td><td>stack_t *uoss</td><td></td><td></td><td></td><td></td></tr>


<tr><td>132</td><td>sys_utime</td><td>char *filename</td><td>struct utimbuf *times</td><td></td><td></td><td></td><td></td></tr>


<tr><td>133</td><td>sys_mknod</td><td>const char *filename</td><td>umode_t mode</td><td>unsigned dev</td><td></td><td></td><td></td></tr>


<tr><td>134</td><td>sys_uselib</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>135</td><td>sys_personality</td><td>unsigned int personality</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>136</td><td>sys_ustat</td><td>unsigned dev</td><td>struct ustat *ubuf</td><td></td><td></td><td></td><td></td></tr>


<tr><td>137</td><td>sys_statfs</td><td>const char *pathname</td><td>struct statfs *buf</td><td></td><td></td><td></td><td></td></tr>


<tr><td>138</td><td>sys_fstatfs</td><td>unsigned int fd</td><td>struct statfs *buf</td><td></td><td></td><td></td><td></td></tr>


<tr><td>139</td><td>sys_sysfs</td><td>int option</td><td>unsigned long arg1</td><td>unsigned long arg2</td><td></td><td></td><td></td></tr>


<tr><td>140</td><td>sys_getpriority</td><td>int which</td><td>int who</td><td></td><td></td><td></td><td></td></tr>


<tr><td>141</td><td>sys_setpriority</td><td>int which</td><td>int who</td><td>int niceval</td><td></td><td></td><td></td></tr>


<tr><td>142</td><td>sys_sched_setparam</td><td>pid_t pid</td><td>struct sched_param *param</td><td></td><td></td><td></td><td></td></tr>


<tr><td>143</td><td>sys_sched_getparam</td><td>pid_t pid</td><td>struct sched_param *param</td><td></td><td></td><td></td><td></td></tr>


<tr><td>144</td><td>sys_sched_setscheduler</td><td>pid_t pid</td><td>int policy</td><td>struct sched_param *param</td><td></td><td></td><td></td></tr>


<tr><td>145</td><td>sys_sched_getscheduler</td><td>pid_t pid</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>146</td><td>sys_sched_get_priority_max</td><td>int policy</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>147</td><td>sys_sched_get_priority_min</td><td>int policy</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>148</td><td>sys_sched_rr_get_interval</td><td>pid_t pid</td><td>struct timespec *interval</td><td></td><td></td><td></td><td></td></tr>


<tr><td>149</td><td>sys_mlock</td><td>unsigned long start</td><td>size_t len</td><td></td><td></td><td></td><td></td></tr>


<tr><td>150</td><td>sys_munlock</td><td>unsigned long start</td><td>size_t len</td><td></td><td></td><td></td><td></td></tr>


<tr><td>151</td><td>sys_mlockall</td><td>int flags</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>152</td><td>sys_munlockall</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>153</td><td>sys_vhangup</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>154</td><td>sys_modify_ldt</td><td>int func</td><td>void *ptr</td><td>unsigned long bytecount</td><td></td><td></td><td></td></tr>


<tr><td>155</td><td>sys_pivot_root</td><td>const char *new_root</td><td>const char *put_old</td><td></td><td></td><td></td><td></td></tr>


<tr><td>156</td><td>sys__sysctl</td><td>struct __sysctl_args *args</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>157</td><td>sys_prctl</td><td>int option</td><td>unsigned long arg2</td><td>unsigned long arg3</td><td>unsigned long arg4</td><td></td><td>unsigned long arg5</td></tr>


<tr><td>158</td><td>sys_arch_prctl</td><td>struct task_struct *task</td><td>int code</td><td>unsigned long *addr</td><td></td><td></td><td></td></tr>


<tr><td>159</td><td>sys_adjtimex</td><td>struct timex *txc_p</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>160</td><td>sys_setrlimit</td><td>unsigned int resource</td><td>struct rlimit *rlim</td><td></td><td></td><td></td><td></td></tr>


<tr><td>161</td><td>sys_chroot</td><td>const char *filename</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>162</td><td>sys_sync</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>163</td><td>sys_acct</td><td>const char *name</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>164</td><td>sys_settimeofday</td><td>struct timeval *tv</td><td>struct timezone *tz</td><td></td><td></td><td></td><td></td></tr>


<tr><td>165</td><td>sys_mount</td><td>char *dev_name</td><td>char *dir_name</td><td>char *type</td><td>unsigned long flags</td><td>void *data</td><td></td></tr>


<tr><td>166</td><td>sys_umount2</td><td>const char *target</td><td>int flags</td><td></td><td></td><td></td><td></td></tr>


<tr><td>167</td><td>sys_swapon</td><td>const char *specialfile</td><td>int swap_flags</td><td></td><td></td><td></td><td></td></tr>


<tr><td>168</td><td>sys_swapoff</td><td>const char *specialfile</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>169</td><td>sys_reboot</td><td>int magic1</td><td>int magic2</td><td>unsigned int cmd</td><td>void *arg</td><td></td><td></td></tr>


<tr><td>170</td><td>sys_sethostname</td><td>char *name</td><td>int len</td><td></td><td></td><td></td><td></td></tr>


<tr><td>171</td><td>sys_setdomainname</td><td>char *name</td><td>int len</td><td></td><td></td><td></td><td></td></tr>


<tr><td>172</td><td>sys_iopl</td><td>unsigned int level</td><td>struct pt_regs *regs</td><td></td><td></td><td></td><td></td></tr>


<tr><td>173</td><td>sys_ioperm</td><td>unsigned long from</td><td>unsigned long num</td><td>int turn_on</td><td></td><td></td><td></td></tr>


<tr><td>174</td><td>sys_create_module</td><td>REMOVED IN Linux 2.6</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>175</td><td>sys_init_module</td><td>void *umod</td><td>unsigned long len</td><td>const char *uargs</td><td></td><td></td><td></td></tr>


<tr><td>176</td><td>sys_delete_module</td><td>const chat *name_user</td><td>unsigned int flags</td><td></td><td></td><td></td><td></td></tr>


<tr><td>177</td><td>sys_get_kernel_syms</td><td>REMOVED IN Linux 2.6</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>178</td><td>sys_query_module</td><td>REMOVED IN Linux 2.6</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>179</td><td>sys_quotactl</td><td>unsigned int cmd</td><td>const char *special</td><td>qid_t id</td><td>void *addr</td><td></td><td></td></tr>


<tr><td>180</td><td>sys_nfsservctl</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>181</td><td>sys_getpmsg</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>182</td><td>sys_putpmsg</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>183</td><td>sys_afs_syscall</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>184</td><td>sys_tuxcall</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>185</td><td>sys_security</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>186</td><td>sys_gettid</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>187</td><td>sys_readahead</td><td>int fd</td><td>loff_t offset</td><td>size_t count</td><td></td><td></td><td></td></tr>


<tr><td>188</td><td>sys_setxattr</td><td>const char *pathname</td><td>const char *name</td><td>const void *value</td><td>size_t size</td><td>int flags</td><td></td></tr>


<tr><td>189</td><td>sys_lsetxattr</td><td>const char *pathname</td><td>const char *name</td><td>const void *value</td><td>size_t size</td><td>int flags</td><td></td></tr>


<tr><td>190</td><td>sys_fsetxattr</td><td>int fd</td><td>const char *name</td><td>const void *value</td><td>size_t size</td><td>int flags</td><td></td></tr>


<tr><td>191</td><td>sys_getxattr</td><td>const char *pathname</td><td>const char *name</td><td>void *value</td><td>size_t size</td><td></td><td></td></tr>


<tr><td>192</td><td>sys_lgetxattr</td><td>const char *pathname</td><td>const char *name</td><td>void *value</td><td>size_t size</td><td></td><td></td></tr>


<tr><td>193</td><td>sys_fgetxattr</td><td>int fd</td><td>const har *name</td><td>void *value</td><td>size_t size</td><td></td><td></td></tr>


<tr><td>194</td><td>sys_listxattr</td><td>const char *pathname</td><td>char *list</td><td>size_t size</td><td></td><td></td><td></td></tr>


<tr><td>195</td><td>sys_llistxattr</td><td>const char *pathname</td><td>char *list</td><td>size_t size</td><td></td><td></td><td></td></tr>


<tr><td>196</td><td>sys_flistxattr</td><td>int fd</td><td>char *list</td><td>size_t size</td><td></td><td></td><td></td></tr>


<tr><td>197</td><td>sys_removexattr</td><td>const char *pathname</td><td>const char *name</td><td></td><td></td><td></td><td></td></tr>


<tr><td>198</td><td>sys_lremovexattr</td><td>const char *pathname</td><td>const char *name</td><td></td><td></td><td></td><td></td></tr>


<tr><td>199</td><td>sys_fremovexattr</td><td>int fd</td><td>const char *name</td><td></td><td></td><td></td><td></td></tr>


<tr><td>200</td><td>sys_tkill</td><td>pid_t pid</td><td>ing sig</td><td></td><td></td><td></td><td></td></tr>


<tr><td>201</td><td>sys_time</td><td>time_t *tloc</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>202</td><td>sys_futex</td><td>u32 *uaddr</td><td>int op</td><td>u32 val</td><td>struct timespec *utime</td><td>u32 *uaddr2</td><td>u32 val3</td></tr>


<tr><td>203</td><td>sys_sched_setaffinity</td><td>pid_t pid</td><td>unsigned int len</td><td>unsigned long *user_mask_ptr</td><td></td><td></td><td></td></tr>


<tr><td>204</td><td>sys_sched_getaffinity</td><td>pid_t pid</td><td>unsigned int len</td><td>unsigned long *user_mask_ptr</td><td></td><td></td><td></td></tr>


<tr><td>205</td><td>sys_set_thread_area</td><td>NOT IMPLEMENTED. Use arch_prctl</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>206</td><td>sys_io_setup</td><td>unsigned nr_events</td><td>aio_context_t *ctxp</td><td></td><td></td><td></td><td></td></tr>


<tr><td>207</td><td>sys_io_destroy</td><td>aio_context_t ctx</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>208</td><td>sys_io_getevents</td><td>aio_context_t ctx_id</td><td>long min_nr</td><td>long nr</td><td>struct io_event *events</td><td></td><td></td></tr>


<tr><td>209</td><td>sys_io_submit</td><td>aio_context_t ctx_id</td><td>long nr</td><td>struct iocb **iocbpp</td><td></td><td></td><td></td></tr>


<tr><td>210</td><td>sys_io_cancel</td><td>aio_context_t ctx_id</td><td>struct iocb *iocb</td><td>struct io_event *result</td><td></td><td></td><td></td></tr>


<tr><td>211</td><td>sys_get_thread_area</td><td>NOT IMPLEMENTED. Use arch_prctl</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>212</td><td>sys_lookup_dcookie</td><td>u64 cookie64</td><td>long buf</td><td>long len</td><td></td><td></td><td></td></tr>


<tr><td>213</td><td>sys_epoll_create</td><td>int size</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>214</td><td>sys_epoll_ctl_old</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>215</td><td>sys_epoll_wait_old</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>216</td><td>sys_remap_file_pages</td><td>unsigned long start</td><td>unsigned long size</td><td>unsigned long prot</td><td>unsigned long pgoff</td><td>unsigned long flags</td><td></td></tr>


<tr><td>217</td><td>sys_getdents64</td><td>unsigned int fd</td><td>struct linux_dirent64 *dirent</td><td>unsigned int count</td><td></td><td></td><td></td></tr>


<tr><td>218</td><td>sys_set_tid_address</td><td>int *tidptr</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>219</td><td>sys_restart_syscall</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>220</td><td>sys_semtimedop</td><td>int semid</td><td>struct sembuf *tsops</td><td>unsigned nsops</td><td>const struct timespec *timeout</td><td></td><td></td></tr>


<tr><td>221</td><td>sys_fadvise64</td><td>int fd</td><td>loff_t offset</td><td>size_t len</td><td>int advice</td><td></td><td></td></tr>


<tr><td>222</td><td>sys_timer_create</td><td>const clockid_t which_clock</td><td>struct sigevent *timer_event_spec</td><td>timer_t *created_timer_id</td><td></td><td></td><td></td></tr>


<tr><td>223</td><td>sys_timer_settime</td><td>timer_t timer_id</td><td>int flags</td><td>const struct itimerspec *new_setting</td><td>struct itimerspec *old_setting</td><td></td><td></td></tr>


<tr><td>224</td><td>sys_timer_gettime</td><td>timer_t timer_id</td><td>struct itimerspec *setting</td><td></td><td></td><td></td><td></td></tr>


<tr><td>225</td><td>sys_timer_getoverrun</td><td>timer_t timer_id</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>226</td><td>sys_timer_delete</td><td>timer_t timer_id</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>227</td><td>sys_clock_settime</td><td>const clockid_t which_clock</td><td>const struct timespec *tp</td><td></td><td></td><td></td><td></td></tr>


<tr><td>228</td><td>sys_clock_gettime</td><td>const clockid_t which_clock</td><td>struct timespec *tp</td><td></td><td></td><td></td><td></td></tr>


<tr><td>229</td><td>sys_clock_getres</td><td>const clockid_t which_clock</td><td>struct timespec *tp</td><td></td><td></td><td></td><td></td></tr>


<tr><td>230</td><td>sys_clock_nanosleep</td><td>const clockid_t which_clock</td><td>int flags</td><td>const struct timespec *rqtp</td><td>struct timespec *rmtp</td><td></td><td></td></tr>


<tr><td>231</td><td>sys_exit_group</td><td>int error_code</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>232</td><td>sys_epoll_wait</td><td>int epfd</td><td>struct epoll_event *events</td><td>int maxevents</td><td>int timeout</td><td></td><td></td></tr>


<tr><td>233</td><td>sys_epoll_ctl</td><td>int epfd</td><td>int op</td><td>int fd</td><td>struct epoll_event *event</td><td></td><td></td></tr>


<tr><td>234</td><td>sys_tgkill</td><td>pid_t tgid</td><td>pid_t pid</td><td>int sig</td><td></td><td></td><td></td></tr>


<tr><td>235</td><td>sys_utimes</td><td>char *filename</td><td>struct timeval *utimes</td><td></td><td></td><td></td><td></td></tr>


<tr><td>236</td><td>sys_vserver</td><td>NOT IMPLEMENTED</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>237</td><td>sys_mbind</td><td>unsigned long start</td><td>unsigned long len</td><td>unsigned long mode</td><td>unsigned long *nmask</td><td>unsigned long maxnode</td><td>unsigned flags</td></tr>


<tr><td>238</td><td>sys_set_mempolicy</td><td>int mode</td><td>unsigned long *nmask</td><td>unsigned long maxnode</td><td></td><td></td><td></td></tr>


<tr><td>239</td><td>sys_get_mempolicy</td><td>int *policy</td><td>unsigned long *nmask</td><td>unsigned long maxnode</td><td>unsigned long addr</td><td>unsigned long flags</td><td></td></tr>


<tr><td>240</td><td>sys_mq_open</td><td>const char *u_name</td><td>int oflag</td><td>mode_t mode</td><td>struct mq_attr *u_attr</td><td></td><td></td></tr>


<tr><td>241</td><td>sys_mq_unlink</td><td>const char *u_name</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>242</td><td>sys_mq_timedsend</td><td>mqd_t mqdes</td><td>const char *u_msg_ptr</td><td>size_t msg_len</td><td>unsigned int msg_prio</td><td>const stuct timespec *u_abs_timeout</td><td></td></tr>


<tr><td>243</td><td>sys_mq_timedreceive</td><td>mqd_t mqdes</td><td>char *u_msg_ptr</td><td>size_t msg_len</td><td>unsigned int *u_msg_prio</td><td>const struct timespec *u_abs_timeout</td><td></td></tr>


<tr><td>244</td><td>sys_mq_notify</td><td>mqd_t mqdes</td><td>const struct sigevent *u_notification</td><td></td><td></td><td></td><td></td></tr>


<tr><td>245</td><td>sys_mq_getsetattr</td><td>mqd_t mqdes</td><td>const struct mq_attr *u_mqstat</td><td>struct mq_attr *u_omqstat</td><td></td><td></td><td></td></tr>


<tr><td>246</td><td>sys_kexec_load</td><td>unsigned long entry</td><td>unsigned long nr_segments</td><td>struct kexec_segment *segments</td><td>unsigned long flags</td><td></td><td></td></tr>


<tr><td>247</td><td>sys_waitid</td><td>int which</td><td>pid_t upid</td><td>struct siginfo *infop</td><td>int options</td><td>struct rusage *ru</td><td></td></tr>


<tr><td>248</td><td>sys_add_key</td><td>const char *_type</td><td>const char *_description</td><td>const void *_payload</td><td>size_t plen</td><td></td><td></td></tr>


<tr><td>249</td><td>sys_request_key</td><td>const char *_type</td><td>const char *_description</td><td>const char *_callout_info</td><td>key_serial_t destringid</td><td></td><td></td></tr>


<tr><td>250</td><td>sys_keyctl</td><td>int option</td><td>unsigned long arg2</td><td>unsigned long arg3</td><td>unsigned long arg4</td><td>unsigned long arg5</td><td></td></tr>


<tr><td>251</td><td>sys_ioprio_set</td><td>int which</td><td>int who</td><td>int ioprio</td><td></td><td></td><td></td></tr>


<tr><td>252</td><td>sys_ioprio_get</td><td>int which</td><td>int who</td><td></td><td></td><td></td><td></td></tr>


<tr><td>253</td><td>sys_inotify_init</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>254</td><td>sys_inotify_add_watch</td><td>int fd</td><td>const char *pathname</td><td>u32 mask</td><td></td><td></td><td></td></tr>


<tr><td>255</td><td>sys_inotify_rm_watch</td><td>int fd</td><td>__s32 wd</td><td></td><td></td><td></td><td></td></tr>


<tr><td>256</td><td>sys_migrate_pages</td><td>pid_t pid</td><td>unsigned long maxnode</td><td>const unsigned long *old_nodes</td><td>const unsigned long *new_nodes</td><td></td><td></td></tr>


<tr><td>257</td><td>sys_openat</td><td>int dfd</td><td>const char *filename</td><td>int flags</td><td>int mode</td><td></td><td></td></tr>


<tr><td>258</td><td>sys_mkdirat</td><td>int dfd</td><td>const char *pathname</td><td>int mode</td><td></td><td></td><td></td></tr>


<tr><td>259</td><td>sys_mknodat</td><td>int dfd</td><td>const char *filename</td><td>int mode</td><td>unsigned dev</td><td></td><td></td></tr>


<tr><td>260</td><td>sys_fchownat</td><td>int dfd</td><td>const char *filename</td><td>uid_t user</td><td>gid_t group</td><td>int flag</td><td></td></tr>


<tr><td>261</td><td>sys_futimesat</td><td>int dfd</td><td>const char *filename</td><td>struct timeval *utimes</td><td></td><td></td><td></td></tr>


<tr><td>262</td><td>sys_newfstatat</td><td>int dfd</td><td>const char *filename</td><td>struct stat *statbuf</td><td>int flag</td><td></td><td></td></tr>


<tr><td>263</td><td>sys_unlinkat</td><td>int dfd</td><td>const char *pathname</td><td>int flag</td><td></td><td></td><td></td></tr>


<tr><td>264</td><td>sys_renameat</td><td>int oldfd</td><td>const char *oldname</td><td>int newfd</td><td>const char *newname</td><td></td><td></td></tr>


<tr><td>265</td><td>sys_linkat</td><td>int oldfd</td><td>const char *oldname</td><td>int newfd</td><td>const char *newname</td><td>int flags</td><td></td></tr>


<tr><td>266</td><td>sys_symlinkat</td><td>const char *oldname</td><td>int newfd</td><td>const char *newname</td><td></td><td></td><td></td></tr>


<tr><td>267</td><td>sys_readlinkat</td><td>int dfd</td><td>const char *pathname</td><td>char *buf</td><td>int bufsiz</td><td></td><td></td></tr>


<tr><td>268</td><td>sys_fchmodat</td><td>int dfd</td><td>const char *filename</td><td>mode_t mode</td><td></td><td></td><td></td></tr>


<tr><td>269</td><td>sys_faccessat</td><td>int dfd</td><td>const char *filename</td><td>int mode</td><td></td><td></td><td></td></tr>


<tr><td>270</td><td>sys_pselect6</td><td>int n</td><td>fd_set *inp</td><td>fd_set *outp</td><td>fd_set *exp</td><td>struct timespec *tsp</td><td>void *sig</td></tr>


<tr><td>271</td><td>sys_ppoll</td><td>struct pollfd *ufds</td><td>unsigned int nfds</td><td>struct timespec *tsp</td><td>const sigset_t *sigmask</td><td>size_t sigsetsize</td><td></td></tr>


<tr><td>272</td><td>sys_unshare</td><td>unsigned long unshare_flags</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>273</td><td>sys_set_robust_list</td><td>struct robust_list_head *head</td><td>size_t len</td><td></td><td></td><td></td><td></td></tr>


<tr><td>274</td><td>sys_get_robust_list</td><td>int pid</td><td>struct robust_list_head **head_ptr</td><td>size_t *len_ptr</td><td></td><td></td><td></td></tr>


<tr><td>275</td><td>sys_splice</td><td>int fd_in</td><td>loff_t *off_in</td><td>int fd_out</td><td>loff_t *off_out</td><td>size_t len</td><td>unsigned int flags</td></tr>


<tr><td>276</td><td>sys_tee</td><td>int fdin</td><td>int fdout</td><td>size_t len</td><td>unsigned int flags</td><td></td><td></td></tr>


<tr><td>277</td><td>sys_sync_file_range</td><td>long fd</td><td>loff_t offset</td><td>loff_t bytes</td><td>long flags</td><td></td><td></td></tr>


<tr><td>278</td><td>sys_vmsplice</td><td>int fd</td><td>const struct iovec *iov</td><td>unsigned long nr_segs</td><td>unsigned int flags</td><td></td><td></td></tr>


<tr><td>279</td><td>sys_move_pages</td><td>pid_t pid</td><td>unsigned long nr_pages</td><td>const void **pages</td><td>const int *nodes</td><td>int *status</td><td>int flags</td></tr>


<tr><td>280</td><td>sys_utimensat</td><td>int dfd</td><td>const char *filename</td><td>struct timespec *utimes</td><td>int flags</td><td></td><td></td></tr>


<tr><td>281</td><td>sys_epoll_pwait</td><td>int epfd</td><td>struct epoll_event *events</td><td>int maxevents</td><td>int timeout</td><td>const sigset_t *sigmask</td><td>size_t sigsetsize</td></tr>


<tr><td>282</td><td>sys_signalfd</td><td>int ufd</td><td>sigset_t *user_mask</td><td>size_t sizemask</td><td></td><td></td><td></td></tr>


<tr><td>283</td><td>sys_timerfd_create</td><td>int clockid</td><td>int flags</td><td></td><td></td><td></td><td></td></tr>


<tr><td>284</td><td>sys_eventfd</td><td>unsigned int count</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>285</td><td>sys_fallocate</td><td>long fd</td><td>long mode</td><td>loff_t offset</td><td>loff_t len</td><td></td><td></td></tr>


<tr><td>286</td><td>sys_timerfd_settime</td><td>int ufd</td><td>int flags</td><td>const struct itimerspec *utmr</td><td>struct itimerspec *otmr</td><td></td><td></td></tr>


<tr><td>287</td><td>sys_timerfd_gettime</td><td>int ufd</td><td>struct itimerspec *otmr</td><td></td><td></td><td></td><td></td></tr>


<tr><td>288</td><td>sys_accept4</td><td>int fd</td><td>struct sockaddr *upeer_sockaddr</td><td>int *upeer_addrlen</td><td>int flags</td><td></td><td></td></tr>


<tr><td>289</td><td>sys_signalfd4</td><td>int ufd</td><td>sigset_t *user_mask</td><td>size_t sizemask</td><td>int flags</td><td></td><td></td></tr>


<tr><td>290</td><td>sys_eventfd2</td><td>unsigned int count</td><td>int flags</td><td></td><td></td><td></td><td></td></tr>


<tr><td>291</td><td>sys_epoll_create1</td><td>int flags</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>292</td><td>sys_dup3</td><td>unsigned int oldfd</td><td>unsigned int newfd</td><td>int flags</td><td></td><td></td><td></td></tr>


<tr><td>293</td><td>sys_pipe2</td><td>int *filedes</td><td>int flags</td><td></td><td></td><td></td><td></td></tr>


<tr><td>294</td><td>sys_inotify_init1</td><td>int flags</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>295</td><td>sys_preadv</td><td>unsigned long fd</td><td>const struct iovec *vec</td><td>unsigned long vlen</td><td>unsigned long pos_l</td><td>unsigned long pos_h</td><td></td></tr>


<tr><td>296</td><td>sys_pwritev</td><td>unsigned long fd</td><td>const struct iovec *vec</td><td>unsigned long vlen</td><td>unsigned long pos_l</td><td>unsigned long pos_h</td><td></td></tr>


<tr><td>297</td><td>sys_rt_tgsigqueueinfo</td><td>pid_t tgid</td><td>pid_t pid</td><td>int sig</td><td>siginfo_t *uinfo</td><td></td><td></td></tr>


<tr><td>298</td><td>sys_perf_event_open</td><td>struct perf_event_attr *attr_uptr</td><td>pid_t pid</td><td>int cpu</td><td>int group_fd</td><td>unsigned long flags</td><td></td></tr>


<tr><td>299</td><td>sys_recvmmsg</td><td>int fd</td><td>struct msghdr *mmsg</td><td>unsigned int vlen</td><td>unsigned int flags</td><td>struct timespec *timeout</td><td></td></tr>


<tr><td>300</td><td>sys_fanotify_init</td><td>unsigned int flags</td><td>unsigned int event_f_flags</td><td></td><td></td><td></td><td></td></tr>


<tr><td>301</td><td>sys_fanotify_mark</td><td>long fanotify_fd</td><td>long flags</td><td>__u64 mask</td><td>long dfd</td><td>long pathname</td><td></td></tr>


<tr><td>302</td><td>sys_prlimit64</td><td>pid_t pid</td><td>unsigned int resource</td><td>const struct rlimit64 *new_rlim</td><td>struct rlimit64 *old_rlim</td><td></td><td></td></tr>


<tr><td>303</td><td>sys_name_to_handle_at</td><td>int dfd</td><td>const char *name</td><td>struct file_handle *handle</td><td>int *mnt_id</td><td>int flag</td><td></td></tr>


<tr><td>304</td><td>sys_open_by_handle_at</td><td>int dfd</td><td>const char *name</td><td>struct file_handle *handle</td><td>int *mnt_id</td><td>int flags</td><td></td></tr>


<tr><td>305</td><td>sys_clock_adjtime</td><td>clockid_t which_clock</td><td>struct timex *tx</td><td></td><td></td><td></td><td></td></tr>


<tr><td>306</td><td>sys_syncfs</td><td>int fd</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>307</td><td>sys_sendmmsg</td><td>int fd</td><td>struct mmsghdr *mmsg</td><td>unsigned int vlen</td><td>unsigned int flags</td><td></td><td></td></tr>


<tr><td>308</td><td>sys_setns</td><td>int fd</td><td>int nstype</td><td></td><td></td><td></td><td></td></tr>


<tr><td>309</td><td>sys_getcpu</td><td>unsigned *cpup</td><td>unsigned *nodep</td><td>struct getcpu_cache *unused</td><td></td><td></td><td></td></tr>


<tr><td>310</td><td>sys_process_vm_readv</td><td>pid_t pid</td><td>const struct iovec *lvec</td><td>unsigned long liovcnt</td><td>const struct iovec *rvec</td><td>unsigned long riovcnt</td><td>unsigned long flags</td></tr>


<tr><td>311</td><td>sys_process_vm_writev</td><td>pid_t pid</td><td>const struct iovec *lvec</td><td>unsigned long liovcnt</td><td>const struct iovcc *rvec</td><td>unsigned long riovcnt</td><td>unsigned long flags</td></tr>


<tr><td>312</td><td>sys_kcmp</td><td>pid_t pid1</td><td>pid_t pid2</td><td>int type</td><td>unsigned long idx1</td><td>unsigned long idx2</td><td></td></tr>


<tr><td>313</td><td>sys_finit_module</td><td>int fd</td><td>const char __user *uargs</td><td>int flags</td><td></td><td></td><td></td></tr>


<tr><td>314</td><td>sys_sched_setattr</td><td>pid_t pid</td><td>struct sched_attr __user *attr</td><td>unsigned int flags</td><td></td><td></td><td></td></tr>


<tr><td>315</td><td>sys_sched_getattr</td><td>pid_t pid</td><td>struct sched_attr __user *attr</td><td>unsigned int size</td><td>unsigned int flags</td><td></td><td></td></tr>


<tr><td>316</td><td>sys_renameat2</td><td>int olddfd</td><td>const char __user *oldname</td><td>int newdfd</td><td>const char __user *newname</td><td>unsigned int flags</td><td></td></tr>


<tr><td>317</td><td>sys_seccomp</td><td>unsigned int op</td><td>unsigned int flags</td><td>const char __user *uargs</td><td></td><td></td><td></td></tr>


<tr><td>318</td><td>sys_getrandom</td><td>char __user *buf</td><td>size_t count</td><td>unsigned int flags</td><td></td><td></td><td></td></tr>


<tr><td>319</td><td>sys_memfd_create</td><td>const char __user *uname_ptr</td><td>unsigned


int flags</td><td></td><td></td><td></td><td></td></tr>


<tr><td>320</td><td>sys_kexec_file_load</td><td>int kernel_fd</td><td>int initrd_fd</td><td>unsigned long cmdline_len</td><td>const char __user *cmdline_ptr</td><td>unsigned long flags</td><td></td></tr>


<tr><td>321</td><td>sys_bpf</td><td>int cmd</td><td>union bpf_attr *attr</td><td>unsigned int size</td><td></td><td></td><td></td></tr>


<tr><td>322</td><td>stub_execveat</td><td>int dfd</td><td>const char __user *filename</td><td>const char __user *const __user *argv</td><td>const char __user *const __user *envp</td><td>int flags</td><td></td></tr>


<tr><td>323</td><td>userfaultfd</td><td>int flags</td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>324</td><td>membarrier</td><td>int cmd</td><td>int flags</td><td></td><td></td><td></td><td></td></tr>


<tr><td>325</td><td>mlock2</td><td>unsigned long start</td><td>size_t len</td><td>int flags</td><td></td><td></td><td></td></tr>


<tr><td>326</td><td>copy_file_range</td><td>int fd_in</td><td>loff_t __user *off_in</td><td>int fd_out</td><td>loff_t __user * off_out</td><td>size_t len</td><td>unsigned int flags</td></tr>


<tr><td>327</td><td>preadv2</td><td>unsigned long fd</td><td>const struct iovec __user *vec</td><td>unsigned long vlen</td><td>unsigned long pos_l</td><td>unsigned long pos_h</td><td>int flags</td></tr>


<tr><td>328</td><td>pwritev2</td><td>unsigned long fd</td><td>const struct iovec __user *vec</td><td>unsigned long vlen</td><td>unsigned long pos_l</td><td>unsigned long pos_h</td><td>int flags</td></tr>


<tr><td>329</td><td>pkey_mprotect</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>330</td><td>pkey_alloc</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>331</td><td>pkey_free</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>332</td><td>statx</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>333</td><td>io_pgetevents</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>334</td><td>rseq</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>


<tr><td>335</td><td>pkey_mprotect</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>

</table>
</details>


<details>
<summary align = "center"> 
<h2 align = "center">TABLE OF ASSEMBLY X86 64-BIT MNEMONICS</h2>
</summary>


  <table align = "center">
    <tr>
      <th>Mnemônico</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>MOV</td>
      <td>Move/Copiar dados</td>
    </tr>
    <tr>
      <td>ADD</td>
      <td>Adicionar</td>
    </tr>
    <tr>
      <td>SUB</td>
      <td>Subtrair</td>
    </tr>
    <tr>
      <td>INC</td>
      <td>Incrementar</td>
    </tr>
    <tr>
      <td>DEC</td>
      <td>Decrementar</td>
    </tr>
    <tr>
      <td>AND</td>
      <td>Operação lógica AND</td>
    </tr>
    <tr>
      <td>OR</td>
      <td>Operação lógica OR</td>
    </tr>
    <tr>
      <td>XOR</td>
      <td>Operação lógica XOR</td>
    </tr>
    <tr>
      <td>NOT</td>
      <td>Operação lógica NOT</td>
    </tr>
    <tr>
      <td>CMP</td>
      <td>Comparar</td>
    </tr>
    <tr>
      <td>JMP</td>
      <td>Salto incondicional</td>
    </tr>
    <tr>
      <td>JE</td>
      <td>Salto se igual</td>
    </tr>
    <tr>
      <td>JNE</td>
      <td>Salto se não igual</td>
    </tr>
    <tr>
      <td>JZ</td>
      <td>Salto se zero</td>
    </tr>
    <tr>
      <td>JNZ</td>
      <td>Salto se não zero</td>
    </tr>
    <tr>
      <td>JL</td>
      <td>Salto se menor</td>
    </tr>
    <tr>
      <td>JLE</td>
      <td>Salto se menor ou igual</td>
    </tr>
    <tr>
      <td>JG</td>
      <td>Salto se maior</td>
    </tr>
    <tr>
      <td>JGE</td>
      <td>Salto se maior ou igual</td>
    </tr>
    <tr>
      <td>CALL</td>
      <td>Chamada de função</td>
    </tr>
    <tr>
      <td>RET</td>
      <td>Retorno de função</td>
    </tr>
    <tr>
      <td>PUSH</td>
      <td>Empilhar dado</td>
    </tr>
    <tr>
      <td>POP</td>
      <td>Desempilhar dado</td>
    </tr>
    <tr>
      <td>LEA</td>
      <td>Carregar endereço efetivo</td>
    </tr>
    <tr>
      <td>NOP</td>
      <td>Nenhuma operação (No operation)</td>
    </tr>
    <tr>
      <td>CMPXCHG</td>
      <td>Comparar e trocar (Atomic compare and exchange)</td>
    </tr>
    <tr>
      <td>LOCK</td>
      <td>Prefixo para instruções atômicas</td>
    </tr>
    <tr>
      <td>XCHG</td>
      <td>Trocar valores entre registradores</td>
    </tr>
    <tr>
      <td>MUL</td>
      <td>Multiplicar</td>
    </tr>
    <tr>
      <td>DIV</td>
      <td>Dividir</td>
    </tr>
    <tr>
      <td>SHL</td>
      <td>Deslocamento à esquerda</td>
    </tr>
    <tr>
      <td>SHR</td>
      <td>Deslocamento à direita</td>
    </tr>
    <tr>
      <td>SAL</td>
      <td>Deslocamento aritmético à esquerda</td>
    </tr>
    <tr>
      <td>SAR</td>
      <td>Deslocamento aritmético à direita</td>
    </tr>
    <tr>
      <td>ROL</td>
      <td>Rotação à esquerda</td>
    </tr>
    <tr>
      <td>ROR</td>
      <td>Rotação à direita</td>
    </tr>
    <tr>
      <td>AND</td>
      <td>Operação lógica AND</td>
    </tr>
    <tr>
      <td>OR</td>
      <td>Operação lógica OR</td>
    </tr>
    <tr>
      <td>NOT</td>
      <td>Operação lógica NOT</td>
    </tr>
    <tr>
      <td>XOR</td>
      <td>Operação lógica XOR</td>
    </tr>
    <tr>
      <td>TEST</td>
      <td>Teste lógico</td>
    </tr>
    <tr>
      <td>CMOV</td>
      <td>Mover se for verdadeiro (Conditional Move)</td>
    </tr>
  </table>
</body>
</html>
</details>


<details>
<summary align = "center"> 
<h2 align = "center">Estrutura Sequencial</h2>
</summary>

<p align = "justify">
 <strong> 1. </strong> Faça um Programa que mostre a mensagem "Alo mundo" na tela.
</p>

<p align = "justify">
 <strong> 2. </strong> Faça um Programa que peça um número e então mostre a mensagem O número informado foi [número].
</p>

<p align = "justify">
 <strong> 3. </strong> Faça um Programa que peça dois números e imprima a soma.
</p>

<p align = "justify">
 <strong> 4. </strong> Faça um Programa que peça as 4 notas bimestrais e mostre a média.
</p>

<p align = "justify">
 <strong> 5. </strong> Faça um Programa que converta metros para centímetros.
</p>

<p align = "justify">
 <strong> 6. </strong> Faça um Programa que peça o raio de um círculo, calcule e mostre sua área.
</p>

<p align = "justify">
 <strong> 7. </strong> Faça um Programa que calcule a área de um quadrado, em seguida mostre o dobro desta área para o usuário.
</p>

<p align = "justify">
 <strong> 8. </strong> Faça um Programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês. Calcule e mostre o total do seu salário no referido mês.
</p>

<p align = "justify">
 <strong> 9. </strong> Faça um Programa que peça a temperatura em graus Fahrenheit, transforme e mostre a temperatura em graus Celsius.
C = 5 * ((F-32) / 9).
</p>

<p align = "justify">
 <strong> 10. </strong> Faça um Programa que peça a temperatura em graus Celsius, transforme e mostre em graus Fahrenheit.
</p>

<p align = "justify">
 <strong> 11. </strong> Faça um Programa que peça 2 números inteiros e um número real. Calcule e mostre:
</p>
<p align="left">
 <strong> a) </strong> o produto do dobro do primeiro com metade do segundo .
</p>
<p align="left">
 <strong> b) </strong> a soma do triplo do primeiro com o terceiro.
</p>
<p align="left">
 <strong> c) </strong> o terceiro elevado ao cubo.
</p>

<p align = "justify">
 <strong> 12. </strong> Tendo como dados de entrada a altura de uma pessoa, construa um algoritmo que calcule seu peso ideal, usando a seguinte fórmula: (72.7*altura) - 58
</p>

<p align = "justify">
 <strong> 13. </strong> Tendo como dado de entrada a altura (h) de uma pessoa, construa um algoritmo que calcule seu peso ideal, utilizando as seguintes fórmulas:
<p>Para homens: (72.7*h) - 58</p>
<p>Para mulheres: (62.1*h) - 44.7</p>
</p>

<p align = "justify">
 <strong> 14. </strong> João Papo-de-Pescador, homem de bem, comprou um microcomputador para controlar o rendimento diário de seu trabalho. Toda vez que ele traz um peso de peixes maior que o estabelecido pelo regulamento de pesca do estado de São Paulo (50 quilos) deve pagar uma multa de R$ 4,00 por quilo excedente. João precisa que você faça um programa que leia a variável peso (peso de peixes) e calcule o excesso. Gravar na variável excesso a quantidade de quilos além do limite e na variável multa o valor da multa que João deverá pagar. Imprima os dados do programa com as mensagens adequadas.
</p>

<p align = "justify">
 <strong> 15. </strong> Faça um Programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês. Calcule e mostre o total do seu salário no referido mês, sabendo-se que são descontados 11% para o Imposto de Renda, 8% para o INSS e 5% para o sindicato, faça um programa que nos dê:
</p>

<p align="left">
<strong>  a)</strong> salário bruto.
</p>
<p align="left">
<strong>  b)</strong> quanto pagou ao INSS.
</p>
<p align="left">
<strong>  c)</strong> quanto pagou ao sindicato.
</p>
<p align="left">
 <strong> d)</strong> quanto pagou de IR. 
</p>
<p align="left">
 <strong> e)</strong> desconto total.
</p>
<p align="left">
 <strong> f)</strong> o salário líquido.
 <p>-calcule os descontos e o salário líquido, conforme a tabela abaixo:</p>
 <pre>
<p>+ Salário Bruto : R$</p>
<p>- IR (11%) : R$</p>
<p>- INSS (8%) : R$</p>
<p>- Sindicato ( 5%) : R$</p>
<p>= Salário Liquido : R$</p>
<p><strong>Obs.:</strong> Salário Bruto - Descontos = Salário Líquido.</p>
 </pre>
<p align = "justify">
 <strong> 16. </strong> Faça um programa para uma loja de tintas. O programa deverá pedir o tamanho em metros quadrados da área a ser pintada. Considere que a cobertura da tinta é de 1 litro para cada 3 metros quadrados e que a tinta é vendida em latas de 18 litros, que custam R$ 80,00. Informe ao usuário a quantidades de latas de tinta a serem compradas e o preço total.
</p>

<p align = "justify">
 <strong> 17. </strong> Faça um Programa para uma loja de tintas. O programa deverá pedir o tamanho em metros quadrados da área a ser pintada. Considere que a cobertura da tinta é de 1 litro para cada 6 metros quadrados e que a tinta é vendida em latas de 18 litros, que custam R$ 80,00 ou em galões de 3,6 litros, que custam R$ 25,00.
Informe ao usuário as quantidades de tinta a serem compradas e os respectivos preços em 2 situações:
</p>

<p align="left">
<strong>  a)</strong> comprar apenas latas de 18 litros;
</p>
<p align="left">
<strong>  b)</strong> comprar apenas galões de 3,6 litros.
</p>

<p align = "justify">
 <strong> 18. </strong> Faça um programa que peça o tamanho de um arquivo para download (em MB) e a velocidade de um link de Internet (em Mbps), calcule e informe o tempo aproximado de download do arquivo usando este link (em minutos).
</p>

<p align = "justify">
 <strong> 19. </strong> Crie um programa que peça um número ao usuário e armazene ele na variável x. Depois peça outro número e armazene na variável y. Mostre esses números. Em seguida, faça com que x passe a ter o valor de y, e que y passe a ter o valor de x.
</p>
</details>
