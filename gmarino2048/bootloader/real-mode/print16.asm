;
;
; print.asm
;

[bits 16] ; real mode

print_bios16:

  ; back up used registers to stack
  push ax
  push bx

  ; BIOS reads 'ah' to determine the functionality to use
  ; interrupt 0x10 is used to make BIOS print
  mov ah, 0x0E ;

  ; repeat until null terminator because we don't know how long the string
  ; will be
  print_bios_loop16:

    ;
    cmp byte[bx], 0
    je print_bios_end16 ; '(j)ump to (e)nd if' bx == 0 (null terminator)

    ; if it's not a null terminator, print it
    mov al, byte[bx]
    int 0x10


    ; increment pointer to next character and jump to begining of loop
    inc bx
    jmp print_bios_loop16

print_bios_end16:

  ; restore register state to the way it was before printing
  pop bx
  pop ax

  ; return to the struction after the 'call' instruction called from
  ret
