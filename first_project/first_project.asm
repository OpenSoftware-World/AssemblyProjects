[BITS 16]
[org 0x7c00]

boot:
    mov ax, 10
    mov bx, 10
    add ax, bx

    mov bl, 10
    div bl

    add al, '0'
    add ah, '0'

    mov [msg], al
    mov [msg+1], ah
    mov byte [msg+2], 0
    mov si, msg
print:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 0x10
    jmp print
done:
    hlt

msg db 0,0,0

times 510-($-$$) db 0
dw 0xAA55