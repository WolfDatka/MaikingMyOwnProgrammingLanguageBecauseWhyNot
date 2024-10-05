section .data
    name_question db "What is your name: ", 0
    name_question_len equ $ - name_question

    greeting_msg db "Hello, ", 0
    greeting_msg_len equ $ - greeting_msg

section .bss
    name resb 775

section .text
    global _start

_start:
    mov rsi, name_question
    mov rdx, name_question_len
    call _print

    mov rsi, name
    mov rdx, 773
    call _get_input

    mov rsi, greeting_msg
    mov rdx, greeting_msg_len
    call _print

    mov rsi, name
    mov rdx, 775
    call _print

    call _exit

_print:
    mov rax, 1
    mov rdi, 1
    syscall

    ret

_get_input:
    xor rax, rax
    xor rdi, rdi
    syscall

    add rsi, rdx

    inc rsi
    mov byte [rsi], 10

    inc rsi
    mov byte [rsi], '0'

    ret

_exit:
    mov rax, 60
    xor rdi, rdi
    syscall
