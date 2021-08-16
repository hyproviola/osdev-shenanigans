;
;
; boot.asm
;
%include "defines.asm"

; BIOS begins executing functions on the first sector
; at location 0x7C00.
; The location must be specified for NASM
[org 0x7C00]

; x86 chips start in 16 bit 'real mode' to allow compatability,
; so we specify this and elevate later.
[bits 16]

; store pointer to string to be printed
mov bx, msg_bootloader_initialized
call print_bios16

; IMPORT OTHER ASM FILES
; basically copy-pasted
%include "real-mode/print16.asm"

; DATA

msg_bootloader_initialized:   db `\r\nBootloader initialized in real mode.\r\n`, 0

; Add padding between end of instructions and the 'magic number';
; The magic number helps bios verify that the sector which the bootloader
; is on, is in fact a boot loader.
; The magic number is 2 bytes, and sectors are 512, so wee need the padding
; to continue until 510 to leave room for the magic number.
times 510 - ($ - $$) db 0x00 ; NASM specific

; Magic number
dw 0xAA55
