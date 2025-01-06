section .data
    message db "Hello, World", 0xA
    length equ $ - message 

section .text 
    global _start

_start:
