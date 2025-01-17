section .data
    prompt db "Enter your name: ", 0
    prompt_len equ $ - prompt
    output db "Hello, ", 0
    newline db 10

section .bss
    name resb 100             ; Reserve 100 bytes for input

section .text
    global _start

_start:
    ; Write prompt message
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor (stdout)
    mov rsi, prompt           ; pointer to prompt message
    mov rdx, prompt_len       ; length of the message
    syscall                   ; call kernel

    ; Read user input
    mov rax, 0                ; syscall number for sys_read
    mov rdi, 0                ; file descriptor (stdin)
    mov rsi, name             ; pointer to input buffer
    mov rdx, 100              ; maximum bytes to read
    syscall                   ; call kernel
    mov rbx, rax              ; store number of bytes read in rbx

    ; Remove newline from input
    dec rbx                   ; Adjust to ignore the newline
    mov byte [name + rbx], 0  ; Replace newline with null terminator

    ; Output "Hello, "
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor (stdout)
    mov rsi, output           ; pointer to output message
    mov rdx, 7                ; length of "Hello, "
    syscall                   ; call kernel

    ; Output the user's name
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor (stdout)
    mov rsi, name             ; pointer to user input
    mov rdx, rbx              ; length of user input (without newline)
    syscall                   ; call kernel

    ; Output a newline
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor (stdout)
    mov rsi, newline          ; pointer to newline character
    mov rdx, 1                ; length of newline
    syscall                   ; call kernel

    ; Exit
    mov rax, 60               ; syscall number for sys_exit
    xor rdi, rdi              ; return 0
    syscall                   ; call kernel
