%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov al, [a]        ; 8-bit 값
    mov ax, [b]        ; 16-bit 값
    mov eax, [c]       ; 32-bit 값
    mov rax, [d]       ; 64-bit 값
    
    mov [d], al        ; 8-bit 값 저장
    mov [e], ax        ; 16-bit 값 저장
    mov [g], eax       ; 32-bit 값 저장
    mov [h], rax       ; 64-bit 값 저장
    
    PRINT_HEX 1, a
    NEWLINE
    PRINT_HEX 2, b
    NEWLINE
    PRINT_HEX 4, c
    NEWLINE
    PRINT_HEX 8, d
    NEWLINE
    
    PRINT_HEX 1, e
    NEWLINE
    PRINT_HEX 2, f
    NEWLINE
    PRINT_HEX 4, g
    NEWLINE
    PRINT_HEX 8, h
    NEWLINE
    
    xor eax, eax
    ret
    
section .data
    a db 0x12         ; 1-byte 값
    b dw 0x1234       ; 2-byte 값
    c dd 0x12345678   ; 4-byte 값
    d dq 0x1234567812345678 ; 8-byte 값

section .bss
    e resb 1          ; 1-byte 크기 할당
    f resw 1          ; 2-byte 크기 할당
    g resd 1          ; 4-byte 크기 할당
    h resq 1          ; 8-byte 크기 할당
