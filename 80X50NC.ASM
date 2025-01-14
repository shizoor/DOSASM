org 100h
entry: jmp _start

section .data
    

section .text
    global _start

_start:
    
   ;Set 80x50 text mode...
   mov ax, 0003h
   int 10h ;first set mode 03h
   xor bx, bx
   mov ax, 1112h
   int 10h ;load 8x8 font (we hope that controller has 
        ; an internal font that we can use).
    
   int 21h         ; Call the DOS interrupt 21h to execute the function

   ; Exit the program
   mov ah, 4Ch     ; AH=4Ch means "exit" function
   xor al, al      ; Set AL to 0 (return code)
   int 21h         ; Call the DOS interrupt 21h to exit the program
