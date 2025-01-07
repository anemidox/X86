BITS 64

section .data
    hello db 'Hello, World!', 0   ; Null-terminated string

section .text
    global _start                   ; Entry point for the program

_start:
    ; Write "Hello, World!" to standard output
    mov rax, 0x1                    ; syscall number for sys_write (1)
    mov rdi, 0                       ; file descriptor (0 = stdout)
    mov rsi, hello                   ; pointer to the "Hello, World!" string
    mov rdx, 13                      ; length of the string (13 bytes)
    syscall                          ; make the system call

    ; Exit the program
    mov rax, 0x60                    ; syscall number for sys_exit (60)
    xor rdi, rdi                     ; exit code 0
    syscall                          ; make the system call
