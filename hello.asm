section .data
    ; Messages
    prompt db "Enter your name: ", 0
    hello db "Hello, ", 0
    newline db 0x0A

section .bss
    ; Buffer for user input
    name resb 32  ; Reserve 32 bytes for the name

section .text
    global _start

_start:
    ; Print the prompt message
    mov rsi, prompt
    mov rdx, 16   ; Length of "Enter your name: "
    call print_string

    ; Read user input
    mov rsi, name
    mov rdx, 32   ; Maximum input length
    call read_input

    ; Print "Hello, "
    mov rsi, hello
    mov rdx, 7    ; Length of "Hello, "
    call print_string

    ; Print the user's name
    mov rsi, name
    call get_string_length
    mov rdx, rax  ; Length of the name
    call print_string

    ; Print a newline
    mov rsi, newline
    mov rdx, 1    ; Length of newline
    call print_string

    ; Exit the program
    mov rax, 60   ; syscall: exit
    xor rdi, rdi  ; status: 0
    syscall

; Function to print a string
print_string:
    mov rax, 1    ; syscall: write
    mov rdi, 1    ; file descriptor: stdout
    syscall
    ret

; Function to read user input
read_input:
    mov rax, 0    ; syscall: read
    mov rdi, 0    ; file descriptor: stdin
    syscall
    ret

; Function to calculate the length of a string
get_string_length:
    xor rcx, rcx  ; Clear RCX (counter)
    .loop:
        cmp byte [rsi + rcx], 0x0A  ; Check for newline (end of input)
        je .done
        cmp byte [rsi + rcx], 0     ; Check for null terminator
        je .done
        inc rcx
        jmp .loop
    .done:
    mov rax, rcx  ; Return length in RAX
    ret