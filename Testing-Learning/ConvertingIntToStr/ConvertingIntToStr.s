section .bss
    result_buff resb 21
    result_buff_len resb 1

section .data
    num dq 533

section .text
    global _start

_start:
    mov rax, [num]
    mov rdi, result_buff
    call int_to_str

    mov eax, 1
    mov edi, eax
    lea rsi, [result_buff]
    mov rdx, 21
    syscall

    mov eax, 60
    xor edi, edi
    syscall

int_to_str:
    mov rbx, 10
    


















; convertion_loop:
;     xor rdx, rdx
;     div rbx
;     add dl, '0'
;     mov [rcx], dl
;     inc rcx
; 
;     test rax, rax
;     jnz convertion_loop
; 
;     mov byte [rcx], '0'
;     sub rcx, result_buff
;     mov [result_buff_len], rcx
; 
; reverse_loop_init:
;     add rcx, result_buff
;     sub rcx, 1
;     mov rdx, result_buff
; 
; reverse_loop:
;     mov rbx, rdx
;     mov rdx, rcx
;     mov rcx, rbx
; 
;     inc rdi
;     dec rcx
; 
;     cmp rcx, rdx
;     jz reverse_loop_end
;     jl reverse_loop_end
; 
; reverse_loop_end:
;     ret
