%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debug
    GET_DEC 1,input_a
    GET_DEC 1,input_b
    
    
    ; +
    mov al,[input_a]
    mov bl,[input_b]
    add al, bl
    mov [m_add], al
    
 
    ; -
    mov al,[input_a]
    mov bl,[input_b]
    sub al, bl
    mov [m_sub], al

    
    ; *
    mov ax, 0
    mov al,[input_a]
    mov bl,[input_b] 
    mul bl ; ax = al *bl,  mul para(res)
    mov [m_mul], ax
    
    
    ; /
    mov ax, 0
    mov al,[input_a]
    mov bl,[input_b]
    div bl ; ax / bl  = ah(몫), al(나머지)
    mov bl, ah
    
    mov [m_q], al
    mov [m_r], ah   


    ;output
    PRINT_STRING msg_input_a
    PRINT_DEC 1,input_a
    NEWLINE
    
    PRINT_STRING msg_input_b
    PRINT_DEC 1,input_b
    NEWLINE
    
    PRINT_STRING msg_add
    NEWLINE
    PRINT_DEC 1,m_add
    NEWLINE
    
    PRINT_STRING msg_sub
    NEWLINE
    PRINT_DEC 1,m_sub
    NEWLINE
    
    PRINT_STRING msg_mul
    NEWLINE
    PRINT_DEC 2,m_mul
    NEWLINE
    
    PRINT_STRING msg_q
    NEWLINE
    PRINT_DEC 1,m_q
    NEWLINE
    
    PRINT_STRING msg_r
    NEWLINE
    PRINT_DEC 1,m_r
    NEWLINE
    
    xor rax, rax
    ret
    
section .data    
    msg_input_a db 'input a_data : ', 0x00
    msg_input_b db 'input b_data : ', 0x00
    msg_add db '+ : ', 0x00
    msg_sub db '- : ', 0x00
    msg_mul db '* : ', 0x00
    msg_q db '/(q) : ', 0x00
    msg_r db '/(r) : ', 0x00
    
    
section .bss
    input_a resb 1
    input_b resb 1
    m_add resb 1
    m_sub resb 1
    m_mul resw 1
    m_q resb 1
    m_r resb 1 
    
    
    
    