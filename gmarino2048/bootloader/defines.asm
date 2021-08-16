;
; define.asm
;
; https://en.wikipedia.org/wiki/BIOS_interrupt_call#Invoking_an_interrupt

%define BIOS_START_ADDR              0x7C00
%define BIOS_MAGIC_NUM               0xAA55

; Video Service
%define BIOS_INT_VID_SERV            0x10 ; int 0x10
%define BIOS_W_TTY_CHAR              0x0E ; mov ah, 0x0E
