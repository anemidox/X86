section .data
    message db 'Hello, World!', 0  ; The message to print

section .text
    global _start                 ; Entry point for the program

_start:
    mov eax, 4                    ; Syscall number for sys_write
    mov ebx, 1                    ; File descriptor (stdout)
    mov ecx, message              ; Address of the message
    mov edx, 13                   ; Length of the message
    int 0x80                      ; Make the system call

    mov eax, 1                    ; Syscall number for sys_exit
    xor ebx, ebx                  ; Exit code 0
    int 0x80                      ; Make the system call
