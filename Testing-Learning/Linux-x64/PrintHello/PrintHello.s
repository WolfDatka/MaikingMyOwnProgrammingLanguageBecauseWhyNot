section .data
    hello_msg db "Hello, World!", 0  ; The message to print
    hello_len equ $ - hello_msg        ; Length of the message

section .text
    global _start                       ; Entry point for the program

_start:
    ; Write the message to standard output
    ; File descriptor for stdout is 1
    mov rax, 1                          ; syscall number for sys_write
    mov rdi, 1                          ; file descriptor (1 = stdout)
    mov rsi, hello_msg                  ; pointer to the message
    mov rdx, hello_len                  ; length of the message
    syscall                              ; invoke the system call

    ; Exit the program
    mov rax, 60                         ; syscall number for sys_exit
    mov rdi, 0                          ; exit code (0 = success)
    syscall                              ; invoke the system call
