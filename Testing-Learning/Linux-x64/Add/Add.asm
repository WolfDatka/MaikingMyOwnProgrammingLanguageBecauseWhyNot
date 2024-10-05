section .data
    ; Data section is not needed for this simple example,
    ; but you would put variables here if necessary.

section .text
    global _start    ; Entry point for the program

_start:
    ; Load the first number into register rax
    mov rax, 5       ; rax = 5

    ; Add the second number to rax
    add rax, 10      ; rax = rax + 10 = 15

    ; Now rax contains the result (15)
    
    ; Exit the program
    ; System call number for sys_exit is 60
    mov rdi, 0       ; exit code (0 = success)
    mov rax, 60      ; syscall number for sys_exit
    syscall          ; invoke the system call
