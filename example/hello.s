extern printf
extern scanf

section .data
    inf: db '%d', 0
    ouf: db '%d', 10, 0

section .text
    global main

main:
    sub   rsp, 1000
    mov   qword [rsp+0], 1
    mov   rax, qword [rsp+0]
    mov   qword [rsp+8], rax
    add   qword [rsp+8], 1
    mov   rax, qword [rsp+8]
    mov   qword [rsp+4], rax
    mov   rax, qword [rsp+4]
    mov   qword [rsp+8], rax
    add   qword [rsp+8], 1
    mov   rax, qword [rsp+8]
    mov   qword [rsp+4], rax
    mov  rax, qword [rsp+0]
    mov  rdi, ouf
    mov  rsi, rax
    xor  rax, rax
    call  printf
    mov  rax, qword [rsp+4]
    mov  rdi, ouf
    mov  rsi, rax
    xor  rax, rax
    call  printf
    lea  rax, [rsp+0]
    mov  rdi, inf
    mov  rsi, rax
    xor  rax, rax
    call  scanf
    lea  rax, [rsp+4]
    mov  rdi, inf
    mov  rsi, rax
    xor  rax, rax
    call  scanf
    mov   rax, qword [rsp+0]
    mov   qword [rsp+8], rax
    add   qword [rsp+8], 10
    mov  rax, qword [rsp+8]
    mov  rdi, ouf
    mov  rsi, rax
    xor  rax, rax
    call  printf
    mov   rax, qword [rsp+4]
    mov   qword [rsp+8], rax
    add   qword [rsp+8], 10
    mov  rax, qword [rsp+8]
    mov  rdi, ouf
    mov  rsi, rax
    xor  rax, rax
    call  printf
    add   rsp, 1000

exit:

    mov  rax, 1 ; sys_exit

    mov  ebx, 0

    int  80h
