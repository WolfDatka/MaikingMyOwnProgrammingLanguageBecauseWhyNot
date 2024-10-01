section .data
    msg0 db "Hello, world!", 10, 0
    msg1 db "Hello, whoever!", 10, 0

section .text
    global _start

%macro print 1
    mov rax, %1
    call _print
%endmacro

%macro exit 0
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro

_start:
    print msg0
    print msg1

    exit

_print:
    push rax
    mov rbx, 0

_printLoop:
    inc rax
    inc rbx
    mov cl, [rax]
    cmp cl, 0
    jne _printLoop

    xor rax, rax
    inc rax
    mov rdi, rax
    pop rsi
    mov rdx, rbx
    syscall

    ret

