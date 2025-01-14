org 100h
entry: jmp _start

section .data
    

section .text
    global _start

_start:
    
   ; Set 80x50 text mode...
   mov ax, 0003h
   int 10h ; first set mode 03h
   xor bx, bx
   mov ax, 1112h
   int 10h ; load 8x8 font (we hope that the controller has 
           ; an internal font that we can use).
   
   ; Set cursor shape and visibility
   mov ah, 01h         ; Function 01h: Set cursor shape
   mov ch, 06h         ; Start scanline (visible cursor, adjust as needed)
   mov cl, 07h         ; End scanline
   int 10h             ; BIOS interrupt to set the cursor shape
   

   ; Exit the program
   mov ah, 4Ch         ; AH=4Ch means "exit" function
   xor al, al          ; Set AL to 0 (return code)
   int 21h             ; Call the DOS interrupt 21h to exit the program