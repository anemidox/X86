section .data
    prompt db "Enter your name: ", 0
    prompt_len equ $ - prompt
    name db 0                 ; Placeholder for the user's name
    name_len equ 30           ; Maximum length for the input
    output db "Hello, ", 0    ; Greeting message
    newline db 10             ; Newline character

section .bss
    input resb name_len       ; Reserve space for the input buffer

section .text
    global _start

_start:
    ; Write prompt message
    mov eax, 4                ; sys_write
    mov ebx, 1                ; File descriptor (stdout)
    mov ecx, prompt           ; Pointer to prompt message
    mov edx, prompt_len       ; Length of the message
    int 0x80                  ; Call the kernel

    ; Read user input
    mov eax, 3                ; sys_read
    mov ebx, 0                ; File descriptor (stdin)
    mov ecx, input            ; Pointer to input buffer
    mov edx, name_len         ; Maximum number of bytes to read
    int 0x80                  ; Call the kernel

    ; Output "Hello, "
    mov eax, 4                ; sys_write
    mov ebx, 1                ; File descriptor (stdout)
    mov ecx, output           ; Pointer to output message
    mov edx, 7                ; Length of "Hello, "
    int 0x80                  ; Call the kernel

    ; Output the user's name
    mov eax, 4                ; sys_write
    mov ebx, 1                ; File descriptor (stdout)
    mov ecx, input            ; Pointer to user input
    mov edx, eax              ; Use the number of bytes read
    int 0x80                  ; Call the kernel

    ; Output a newline
    mov eax, 4                ; sys_write
    mov ebx, 1                ; File descriptor (stdout)
    mov ecx, newline          ; Pointer to newline character
    mov edx, 1                ; Length of newline
    int 0x80                  ; Call the kernel

    ; Exit
    mov eax, 1                ; sys_exit
    xor ebx, ebx              ; Return 0
    int 0x80                  ; Call the kernel
