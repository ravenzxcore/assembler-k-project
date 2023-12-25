org 100h
jmp start

;start command
a_x dd 400
a_y dd 350
b_x dd 240
c_x dd 272
c_y dd 220
c_xl dd 275
d_x dd 400
xcount dd 80 
ycount dd 40 

start:      

    mov ah, 00h
    mov al, 12h
    int 10h
    
    
LowerArcDown_start:    
    mov ah, 00
    mov al, 18
    int 10h
    mov ah, 0Ch
    mov al, 15
    mov cx, a_x
    mov dx, a_y
    mov bp, dx
    mov si,dx 
    
LowerArcDown:
    mov bx, cx
    sub bx, 320
    mov ax, bx
    mul bx
    cmp ax, 4
    jle jmp LowerArcDownFormation
    mov bx, 4
    mov dx, 0
    div bx

LowerArcDownFormation:
    mov bx, ax
    sub bx, 1600
    neg bx
    mov ax, bx
    xchg bx, ax
    mov dx, 8000h

@@NextBit_LowerArcDown:
    xor dl, dh
    mov al, dl
    mul al
    cmp ax, bx
    jna @@DontReset_LowerArcDown
    xor dl, dh

@@DontReset_LowerArcDown:
    shr dh, 1
    jnz @@NextBit_LowerArcDown
    xchg ax, dx
    mov bx, ax
    sub di, bx


LowerArcDown_Drawing:    
    mov dx, si
    mov ah, 0Ch
    mov al, 15
    int 10h
    dec cx
    sub dx, di
    mov si, dx
    mov di, bx
    cmp cx, b_x
    jnz LowerArcDown

LowerArcUp_start:
    mov ah, 0Ch
    mov al, 15
    mov cx, d_x
    mov dx, a_y    
    mov bp, dx
    mov si,dx

LowerArcUp:  
    mov bx, cx
    sub bx, 320
    mov ax,bx
    mul bx
    cmp ax, 4
    jle jmp LowerArcUpFormation
    mov bx,4
    mov dx,0
    div bx   
    
LowerArcUpFormation:    
     mov bx, ax
     sub bx, 1600  
     neg bx   
     mov ax, bx 
     xchg bx,ax 
     mov dx,8000h
@@NextBit_LowerArcUp: 
    xor dl,dh
    mov al,dl
    mul al
    cmp ax,bx
    jna @@DontReset_LowerArcUp
    xor dl,dh  
@@DontReset_LowerArcUp: 
    shr dh,1
    jnz @@NextBit_LowerArcUp
    xchg ax,dx 
    mov bx, ax
    sub di, bx
LowerArcUp_Drawing:    
    mov dx, si
    mov ah,0Ch
    mov al, 15
    int 10h
    sub cx, 4
    add dx, di
    mov si, dx
    mov di, bx
    cmp cx,b_x
    jnz LowerArcUp
    
RightLine_start:
    mov ah,0Ch
    mov al, 15
    mov cx,a_x
    mov dx,a_y
RightLine: 
    int 10h
    sub dx, 1
    cmp dx, c_y
    jnz RightLine
LeftLine_start:
    mov ah,0Ch
    mov al, 15
    mov cx,b_x
    mov dx,a_y 
LeftLine:
    int 10h
    sub dx, 1
    cmp dx, c_y
    jnz LeftLine
     
UpperArcUp_start:
    mov di, 0
    mov ah, 0Ch
    mov al, 15
    mov cx, d_x
    mov dx, c_y
    mov bp, dx
    mov si, dx

UpperArcUp:
    mov bx, cx
    sub bx, 320
    mov ax, bx
    mul bx
    cmp ax, 4
    jle jmp UpperArcUpFormation
    mov bx, 4
    mov dx, 0
    div bx

UpperArcUpFormation:
    mov bx, ax
    sub bx, 1600
    neg bx
    mov ax, bx

    xchg bx, ax
    mov dx, 8000h

@@NextBit_UpperArcUp:
    xor dl, dh
    mov al, dl
    mul al
    cmp ax, bx
    jna @@DontReset_UpperArcUp
    xor dl, dh

@@DontReset_UpperArcUp:
    shr dh, 1
    jnz @@NextBit_UpperArcUp
    xchg ax, dx
    mov bx, ax
    sub di, bx

UpperArcUp_Drawing:
    mov dx, si
    mov ah, 0Ch
    mov al, 15
    int 10h
    sub cx, 1
    add dx, di
    mov si, dx
    mov di, bx
    cmp cx, b_x
    jnz UpperArcUp

UpperArcDown_start:
    mov di, 0
    mov ah, 0Ch
    mov al, 15
    mov cx, d_x
    mov dx, c_y
    mov bp, dx
    mov si, dx

UpperArcDown:
    mov bx, cx
    sub bx, 320
    mov ax, bx
    mul bx
    cmp ax, 4
    jle jmp UpperArcDownFormation
    mov bx, 4
    mov dx, 0
    div bx

UpperArcDownFormation:
    mov bx, ax
    sub bx, 1600
    neg bx
    mov ax, bx

    xchg bx, ax
    mov dx, 8000h

@@NextBit_UpperArcDown:
    xor dl, dh
    mov al, dl
    mul al
    cmp ax, bx
    jna @@DontReset_UpperArcDown
    xor dl, dh

@@DontReset_UpperArcDown:
    shr dh, 1
    jnz @@NextBit_UpperArcDown
    xchg ax, dx
    mov bx, ax
    sub di, bx

UpperArcDown_Drawing:
    mov dx, si
    mov ah, 0Ch
    mov al, 15
    int 10h
    sub cx, 1
    sub dx, di
    mov si, dx
    mov di, bx
    cmp cx, b_x
    jnz UpperArcDown

GetKey:
    mov ah, 00
    int 16h
end:
    mov ah, 00
    mov al, 03
    int 10h
    mov ah, 04Ch
    mov al, 00
    int 21h
    ret