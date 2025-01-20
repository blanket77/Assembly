%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debug
    ;write your code here
    
    ;input
    GET_DEC 2,a
    GET_DEC 2,b
    GET_DEC 2,c
    
; max,min
    mov ax, [a]
    mov bx, [b]
    mov cx, [c]
    cmp ax, bx
    jge  NOT_SMALL_1  
    mov [m_max], bx
    mov [m_min], ax
NOT_SMALL_1:
    mov [m_max], ax
    mov [m_min], bx
    
; max
    mov ax, [m_max]
    cmp ax, cx
    jge NOT_SMALL_2
    mov [m_max], cx
NOT_SMALL_2:

;min
    mov ax, [m_min]
    cmp ax, cx
    jle NOT_GREATER
    mov [m_min], cx
NOT_GREATER:
    
    
    ; max*min
    mov ax, [m_max]
    mov bx, [m_min]
    mul bx
    shl edx,16
    and eax, 0x0000ffff ; not need
    or eax,edx
    mov [m_total] ,eax
    
    ;output
    PRINT_STRING msg_input_a
    NEWLINE
    PRINT_DEC 2, a
    NEWLINE
    PRINT_STRING msg_input_b
    NEWLINE
    PRINT_DEC 2, b
    NEWLINE
    PRINT_STRING msg_input_c
    NEWLINE
    PRINT_DEC 2, c
    NEWLINE
    
    PRINT_STRING msg_max
    NEWLINE
    PRINT_DEC 2, m_max
    NEWLINE
    PRINT_STRING msg_min
    NEWLINE
    PRINT_DEC 2, m_min
    NEWLINE
    
    PRINT_STRING msg_total
    NEWLINE
    PRINT_DEC 4, m_total
    NEWLINE
    
    xor rax, rax
    ret
    


section .data    
    msg_input_a db 'input a_data : ', 0x00
    msg_input_b db 'input b_data : ', 0x00
    msg_input_c db 'input c_data : ', 0x00
    msg_max db 'max : ', 0x00
    msg_min db 'min : ', 0x00
    msg_total db 'max * min : ', 0x00

            
section .bss
    a resw 1
    b resw 1
    c resw 1
    m_max resw 1
    m_min resw 1
    m_total resd 1 ; max * min
    