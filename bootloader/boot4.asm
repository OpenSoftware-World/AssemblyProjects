[bits 16]
[org 0x7c00]

mov ah, 0x0E
mov al, 'H'
int 10h
mov al, 'i'
int 10h
mov al, '!'
int 10h

times 510 - ($ - $$) db 0
dw 0xAA55
