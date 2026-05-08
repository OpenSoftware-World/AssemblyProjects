[BITS 16]
[org 0x7C00]

boot:
    mov ax, 0x0600
    mov bh, 0x1F
    mov cx, 0x0000
    mov dx, 0x184F
    int 0x10

    mov ah, 0x02
    mov bh, 0x00
    mov dh, 0x00        
    mov dl, 0x00        
    int 0x10            

    mov si, message
boot_msg:
    lodsb
    cmp al, 0
    je hang
    mov ah, 0x0E
    int 0x10
    jmp boot_msg
hang:
    jmp hang

message db "Test Bootloader v0.1", 0

times 510-($-$$) db 0
dw 0xAA55
