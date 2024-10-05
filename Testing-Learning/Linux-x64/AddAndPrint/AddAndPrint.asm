section .data
    result_msg db "Result: ", 0
    result_len equ $ - result_msg

    num1 dq 5
    num2 dq 6
    result dq 0

section .text
    global _start

_start:
    mov rax, [num1]
    add rax, [num2]
    mov [result], rax

    mov rax, 1
    mov rdi, 1
    mov rsi, result_msg
    mov rdx, result_len
    syscall

    mov rdi, 0
    mov rax, 60
    syscall
