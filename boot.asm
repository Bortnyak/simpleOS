ORG 0x7c00
BITS 16

start:
    mov si, message ;move address of the message to si register
    call print ;call print subroutin
    jmp $


print:
    mov bx, 0 ;set bx to 0
.loop:
    lodsb ;see where si register is pointing
    cmp al, 0 ;compare al to 0 if yes - done, if no - print_char and loop
    je .done
    call print_char
    jmp .loop
.done:
    ret ;return from subroutin

print_char:
    mov ah, 0eh ; 0eh - function for outoutting to the screen when talking to bios
    int 0x10
    ret
message: db 'Hello World!', 0

times 510-($ - $$) db 0
dw 0xAA55