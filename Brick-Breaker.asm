.model small
.stack 100h

.data
;==============SOUND===============

sound Macro
mov ah,2
mov dl,07h
int 21h
endm

;===============GRAPHICS============

Graphics Macro

mov ah,0
mov al,13h
int 10h

endm

;===============PRINT================

Print Macro P1,P2,P3

mov ah, 02h
mov dh, P1  ; dh is x coordinate
mov dl, P2  ; dl is y coordinate
int 10h

mov dx, offset P3
mov ah, 9h
int 21h

endm

Print_val Macro P1,P2,P3

mov ah, 02h
mov dh, P1  ; dh is x coordinate
mov dl, P2  ; dl is y coordinate
int 10h

mov dl, P3
add dl,48
mov ah, 2h
int 21h

endm

;===============HEARTS===============

Heart Macro P1,P2

mov ah, 02h
mov dh, P1  ;dh is x coordinate
mov dl, P2  ;dl is y coordinate
int 10h
mov dx, 3
mov ah, 2h
int 21h    

endm


;============PIXEL=============

Pixel Macro p1 , p2 

mov dx,p1
mov cx,p2
mov al,1011b
mov ah,0ch

int 10h

endm

;============BRICKS=========

Brick Macro P1,P2


mov bx, P1
mov cx, P2   
mov startx,bx
add bx, 35
mov endx,bx
mov starty,cx
add cx,10
mov endy,cx
call draw

endm
     
;================================

;============TALHA MACROS====================

PrintS Macro p1,x,y
mov ah, 02h
mov dh, x  ;dh is x coordinate
mov dl, y  ;dl is y coordinate
int 10h
mov dx,offset p1
mov ah, 9h
int 21h

endm

press macro
mov ah,0
int 16h     
endm

      
clear macro
mov ah,0
mov al,13h
int 10h
endm    

Strike macro pp 
mov color,pp
mov bx, strikerx
mov cx, strikery   
mov startx,bx
add bx, stSize
mov endx,bx
mov starty,cx
mov endy,188    
endm 

NewStrikeL macro pp
mov color,pp
mov bx, strikeAfter
sub bx,10            ;SPEED
mov strikeAfter,bx
mov bx, strikerx
sub bx,10            ;SPEED
mov strikerx,bx
mov cx, strikery   
mov startx,bx
add bx, stSize
mov endx,bx
mov starty,cx
mov endy,188

endm 


NewStrikeR macro pp
mov color,pp
mov bx, strikeAfter
add bx,10            ;SPEED
mov strikeAfter,bx
mov bx, strikerx
add bx,10            ;SPEED
mov strikerx,bx
mov cx, strikery   
mov startx,bx
add bx, stSize
mov endx,bx
mov starty,cx
mov endy,188

endm
;==================DATA======================
     

brick1x dw 30
brick1y dw 30

brick2x dw 30
brick2y dw 50

brick3x dw 30
brick3y dw 70

brick4x dw 30
brick4y dw 90

;----------- first layer ------------

brick5x dw 80
brick5y dw 30

brick6x dw 80
brick6y dw 50

brick7x dw 80
brick7y dw 70

brick8x dw 80
brick8y dw 90

;-------- second layer ----------

brick9x dw 130
brick9y dw 30

brick10x dw 130
brick10y dw 50

brick11x dw 130
brick11y dw 70

brick12x dw 130
brick12y dw 90

;-------- Third Layer ----------

brick13x dw 180
brick13y dw 30

brick14x dw 180
brick14y dw 50

brick15x dw 180
brick15y dw 70

brick16x dw 180
brick16y dw 90

;-------- Fourth Layer ----------


brick17x dw 230
brick17y dw 30

brick18x dw 230
brick18y dw 50

brick19x dw 230
brick19y dw 70

brick20x dw 230
brick20y dw 90

score db 'Score: $'
score_val db 0
rem db 0

lives db 'Lives:$'

level db 'Level:$'
level_val db 1

bally dw 165			
ballx dw 155 

ogbally dw 165
ogballx dw 155

strikerx dw 128
strikery dw 180
;strikeMid dw 188
strikeAfter dw 188
stSize dw 60

starty dw ?
startx dw ?

color db ?

endx dw ?
endy dw ?

heartcount db 3
ogheartcount dw 3

instr0 db "- Move Striker With The Arrow Keys. $"
instrr db "- Destroy All The Bricks To Win.$"
instr2 db "- Press 'P' To Pause The Game.$" 
instr3 db "- Press 'ESC' To Exit The Game.$"
instr4 db "- Each Brick Is 3 Points. !$"
instr5 db "- Remember, You Only Have 3 Lives.!$" 
instr6 db "- Beat All 3 Levels To Win.!$"
stgame db "Press 'SPACE' To Play!$"

cre1 db "Made by: $"
cre2 db "21i-2536 Talha Muazzam$"
cre3 db "21i-1385 Abdullah Khan$"

string db "Brick Breaker$"
str1   db "Play Game$"
str2   db "Credits$"
str3   db "High Score$"
str4   db "Instructions$"
str5   db "Exit$"  
str6   db "Enter your name:$" 
strwe  db "Welcome to Brick Breaker$"
stryou db "Your name: $"
strname db 100 dup('$')
how db "(Press 1-5)$" 
empty db "     $" 

youwin db "YOU WIN!!!$"
afw db "Press any key to go$" 
afw1 db "to the next level$"
afw2 db "Press E to exit$"

youlose db "YOU LOSE :($"
afl db "Press any key to go$" 
afl1 db "to the main menu$"

scoree db "HIGH SCORES:$"

checkTime db 0 

Xspeed dw 02h
Yspeed dw 03h

random dw 0


widths  dw 310d
heights dw 175d  

lifecount db 0
count db 0

bbb db 0
mmm db 0
ooo db 0

b1 db 1
b2 db 1
b3 db 1 
b4 db 1
b5 db 1
b6 db 1
b7 db 1
b8 db 1
b9 db 1
b10 db 1
b11 db 1
b12 db 1
b13 db 1
b14 db 1
b15 db 1 
b16 db 1
b17 db 1
b18 db 1
b19 db 1
b20 db 1

cb1 db 1
cb2 db 1
cb3 db 1 
cb4 db 1
cb5 db 1
cb6 db 1
cb7 db 1
cb8 db 1
cb9 db 1
cb10 db 1
cb11 db 1
cb12 db 1
cb13 db 1
cb14 db 1
cb15 db 1 
cb16 db 1
cb17 db 1
cb18 db 1
cb19 db 1
cb20 db 1

fname db 'Bricks.txt',0
fhandle dw ?			; Contains Address of File 
msg db ? 

.code
;===============================================

;===================MAIN========================
main proc

mov ax, @data
mov ds,ax
     
mov ax,0
mov bx,0     
mov cx,0
mov dx,0

mov ah, 0
mov al, 13h
int 10h     


call first 
clear  
Again:
back:
mov bbb,0 
mov mmm,0
 
call menu

press 
mov bl,al  
cmp al,1+48
je NewGame
jmp Other1

NewGame:
mov ax,0

    


	mov ax,@data
	mov ds,ax
	mov ax,0
	mov level_val,1
    call Display
    
    jmp ENDD



Other1:

mov bl,al  
cmp al,2+48
je Instruction
jmp Other2

Instruction:


   call instructions
   
   clear
   cmp bbb,1
   je back
    




Other2:

mov bl,al  
cmp al,4+48
je cred
jmp Other3

cred:


   call Credit
   
   clear
   cmp bbb,1
   je back
    




Other3: 

mov bl,al  
cmp al,3+48
je scc
jmp Other4

scc:


   call highscore
   
   clear
   cmp bbb,1
   je back
    




Other4:
  
cmp al,5+48
je ENDD
jmp Again

ENDD:

cmp mmm,1
je back

clear
mov ax,4c00h
int 21h
main endp

;==========================================
;=================MENU=====================

menu proc


mov ax, @data
mov ds,ax

mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,25

l1:
mov ah,0ch
mov al,5h
int 10h
inc cx
mov bx,cx
cmp bx,220
jne l1
je kl

kl:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,220
mov dx,25

l2:
mov ah,0ch
mov al,5h
int 10h
inc dx
mov bx,dx
cmp bx,45
jne l2
je k2

k2:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,220
mov dx,45

l3:
mov ah,0ch
mov al,5h
int 10h
dec cx
mov bx,cx
cmp bx,80
jne l3
je k3

k3:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,45

l4:
mov ah,0ch
mov al,5h
int 10h
dec dx
mov bx,dx
cmp bx,25
jne l4
je k4

k4:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,50

l5:
mov ah,0ch
mov al,5h
int 10h
inc cx
mov bx,cx
cmp bx,220
jne l5
je k5

k5:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,220
mov dx,50

l6:
mov ah,0ch
mov al,5h
int 10h
inc dx
mov bx,dx
cmp bx,70
jne l6
je k6

k6:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,220
mov dx,70

l7:
mov ah,0ch
mov al,5h
int 10h
dec cx
mov bx,cx
cmp bx,80
jne l7
je k7

k7:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,70

l8:
mov ah,0ch
mov al,5h
int 10h
dec dx
mov bx,dx
cmp bx,50
jne l8
je k8

k8:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,75

l9:
mov ah,0ch
mov al,5h
int 10h
inc cx
mov bx,cx
cmp bx,220
jne l9
je k9

k9:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,220
mov dx,75

l10:
mov ah,0ch
mov al,5h
int 10h
inc dx
mov bx,dx
cmp bx,95
jne l10
je k10

k10:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,220
mov dx,95

l11:
mov ah,0ch
mov al,5h
int 10h
dec cx
mov bx,cx
cmp bx,80
jne l11
je k11

k11:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,95

l12:
mov ah,0ch
mov al,5h
int 10h
dec dx
mov bx,dx
cmp bx,75
jne l12
je k12

k12:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,100

l13:
mov ah,0ch
mov al,5h
int 10h
inc cx
mov bx,cx
cmp bx,220
jne l13
je k13

k13:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,220
mov dx,100

l14:
mov ah,0ch
mov al,5h
int 10h
inc dx
mov bx,dx
cmp bx,120
jne l14
je k14

k14:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0

mov cx,220
mov dx,120

l15:
mov ah,0ch
mov al,5h
int 10h
dec cx
mov bx,cx
cmp bx,80
jne l15
je k15

k15:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,120

l16:
mov ah,0ch
mov al,5h
int 10h
dec dx
mov bx,dx
cmp bx,100
jne l16
je k16

k16:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,125

l17:
mov ah,0ch
mov al,5h
int 10h
inc cx
mov bx,cx
cmp bx,220
jne l17
je k17

k17:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,220
mov dx,125

l18:
mov ah,0ch
mov al,5h
int 10h
inc dx
mov bx,dx
cmp bx,145
jne l18
je k18

k18:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0

mov cx,220
mov dx,145

l19:
mov ah,0ch
mov al,5h
int 10h
dec cx
mov bx,cx
cmp bx,80
jne l19
je k19

k19:


mov ax,0
mov bx,0     
mov cx,0
mov dx,0


mov cx,80
mov dx,145

l20:
mov ah,0ch
mov al,5h
int 10h
dec dx
mov bx,dx
cmp bx,125
jne l20
je k20

k20:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;WORDS;;;;;;;;;;;;;;;;;;;;


PrintS string,1,13

PrintS str1,4,15

PrintS str4,7,14

PrintS str3,10,14

PrintS str2,13,15

PrintS str5,16,17

PrintS stryou,20,7

PrintS strname,20,18

PrintS how,22,13           

ret
menu endp
;=======================================================


;=====================OPENING_PAGE======================
first proc
    
    
mov ax, @data
mov ds,ax

mov ax,0
mov bx,0     
mov cx,0
mov dx,0
           
mov ah, 02h
mov dh, 2  ;dh is x coordinate
mov dl, 2  ;dl is y coordinate
int 10h
mov dx,offset strwe
mov ah, 9h
int 21h

mov ax,0
mov bx,0     
mov cx,0
mov dx,0
           
mov ah, 02h
mov dh, 5  ;dh is x coordinate
mov dl, 2  ;dl is y coordinate
int 10h
mov dx,offset str6
mov ah, 9h
int 21h           

        
mov si,offset strname
llo:

mov ah,1
int 21h
cmp al,13
je input
mov [si],al
inc si
jmp llo 
 
input:


 

 ret          
           
first endp


;======================================================= 


;==============================|=========================
;=========================MSive L=========================

Loss proc
    
 clear    
 Graphics
call drawBoundary


      
PrintS string,1,14      

PrintS youlose,7,14
PrintS afl,10,11

PrintS afl1,11,11

press

mov mmm,1
call reset
ret
 


Loss endp 

;==============================|=========================
;=========================MSive W=========================

Win proc
    
 clear    
 Graphics
call drawBoundary


      
PrintS string,1,14      

PrintS youwin,7,14
PrintS afl,10,11

PrintS afl1,11,11

press

mov mmm,1
call reset
ret
 


Win endp

;=========================LEVELSCREEN=========================

levelscreen proc
    
 clear    
 Graphics
call drawBoundary


      
PrintS string,1,14      

PrintS youwin,7,14
PrintS afw,10,11

PrintS afw1,11,11
PrintS afw2,14,12

press
.if(al==069d || al==101d)
mov mmm,1
call reset
ret
.else    
call reset
inc level_val 
mov ooo,1
.endif
ret 
 
 
Asf:      
ret

levelscreen endp 
;================== DRAW ==================

draw proc

    push ax
    push cx
    push dx
     
    mov dx,starty
    mov cx,startx
    mov ah,0ch
    mov al,color

c1:
    inc cx
    int 10h
    cmp cx,endx
    jne c1

    mov cx,startx
    inc dx
    cmp dx,endy
    jne c1 
    
    pop dx
    pop cx
    pop ax
    ret

draw endp


;================== Display ====================

Display Proc
    
    nextlevel:
    mov ooo,0
	Graphics
	call drawBoundary
	
	Print 1,1,score
	Print_val 1,7,score_val
	Print 1,16,level
	Print_val 1,22,level_val
    	Print 1,28,lives
	Heart 1,34
	Heart 1,36
	Heart 1,38
	call Bricks
    ;mov strikeAfter,168
    ;mov stSize,40
		 call checklevel
	BALLTIME:
 
	
	mov ah,2ch  ;time
	int 21h      ; ch hour| cl:min |dh sec .....dl
	
	cmp dl,checkTime
	JE BALLTIME 
    mov checkTime, dl
    ;clear
    call drawBoundary
    ;inc random
    ;.if(random==5 || random==24 ||  random==50 || random==75 || random==102 || random==125 ||random==160 ||random==215 ||random==130 ||random==188 ||random==215 ||random==245 ||random==275 ||random==315 )
    ;inc Yspeed
    ;;.elseif(random==15 || random==14 ||  random==40 || random==65 || random==92 || random==115 ||random==130 ||random==150 ||random==175 ||random==200 ||random==230 ||random==260 ||random==300)
    ;dec Yspeed

    ;.endif    

	;Print 1,1,score
	;Print_val 1,7,score_val
	;Print 1,16,level
	;Print_val 1,22,level_val
    ;  Print 1,28,lives
	;call DispHeart
	
    ;call Pauser
    
    call Baller
    call MovBall	
    call Ball
    
   
    call BrickCheck
    call Striker               
     ;call drawStriker   
   ; call checkStriker
   
 
   .if(score_val>= 98&& level_val==3)
   call Win
   .elseif(score_val==100 && level_val==2)
   call levelscreen
   .elseif(score_val==60&& level_val==1)
   call levelscreen
   .endif 
   
   .if(heartcount==0)
   call Loss
   jmp ass
   .endif
   
   cmp ooo,1
   je nextlevel   
   cmp mmm,1
   je ass 
   jmp BALLTIME 
      ass:
      clear
    ;call Striker


ret
Display endp

;===========================================

;================== Instructions Menu ==================

Instructions Proc
clear
Graphics
call drawBoundary

PrintS string,1,13
PrintS instr0,6,1
PrintS instrr,8,1
PrintS instr2,10,1
PrintS instr3,12,1
PrintS instr4,14,1
PrintS instr5,16,1
PrintS instr6,18,1
;PrintS stgame,21,8

k1:
press
   
mov bl,al
.if(al==066d || al==098d)
mov bbb,1
ret
.else
jmp k1
.endif
ret 

Instructions endp

;========================HighScore========================

highscore Proc
clear

Graphics
call drawBoundary



PrintS string,1,13
PrintS scoree,6,1

k1:
press
   
mov bl,al
.if(al==066d || al==098d)
mov bbb,1
ret
.else
jmp k1
.endif
ret 

highscore endp

;==========================Credits========================
Credit Proc
clear
Graphics
call drawBoundary

PrintS string,1,13
PrintS cre1,6,1
;PrintS instrr,8,1
PrintS cre2,10,1
;PrintS instr3,12,1
PrintS cre3,14,1
;PrintS instr5,16,1
;PrintS instr6,18,1
;PrintS stgame,21,8

k2:
press
   
mov bl,al
.if(al==066d || al==098d)
mov bbb,1
ret
.else
jmp k2
.endif
ret 
Credit endp

;================== Pause Menu =====================

Pauser proc

;Graphics
;call drawBoundary



mov ah,01H
int 16h 

jz Agg
      
      
mov ah,0
int 16h

mov bl,al
.if(al==080d || al==112d)
;PrintS string,1,14
;PrintS str1,11,16
;PrintS str2,8,17
;PrintS str3,14,15
;PrintS str4,17,14
;PrintS str5,21,18 
press
.if(al==069d || al==101d)
mov mmm,1
call reset
ret
.else
ret
.endif
ret
.else
ret
.endif
ret 
 
 
Agg:      
ret
Pauser endp

;==================Level Proc=======================
checklevel proc
.if(level_val == 1)

mov Xspeed ,02h
mov Yspeed, 03h

.elseif(level_val == 2)

mov Xspeed, 03h
mov Yspeed ,04h

mov b1 ,2
mov b2 ,2
mov b3 ,2 
mov b4 ,2
mov b5 ,2
mov b6 ,2
mov b7 ,2
mov b8 ,2
mov b9 ,2
mov b10 ,2
mov b11 ,2
mov b12 ,2
mov b13 ,2
mov b14 ,2
mov b15 ,2 
mov b16 ,2
mov b17 ,2
mov b18 ,2
mov b19 ,2
mov b20 ,2
mov strikeAfter,168
mov stSize,40

.elseif(level_val == 3)

mov Xspeed, 04h
mov Yspeed ,05h


mov b1 ,3
mov b2 ,99
mov b3 ,3 
mov b4 ,3
mov b5 ,99
mov b6 ,3
mov b7 ,3
mov b8 ,3
mov b9 ,99
mov b10 ,3
mov b11 ,3
mov b12 ,3
mov b13 ,99
mov b14 ,3
mov b15 ,3 
mov b16 ,3
mov b17 ,99
mov b18 ,3
mov b19 ,99
mov b20 ,3
mov strikeAfter,158
mov stSize,30

.endif

ret
checklevel endp
;====================Reset=============================  

reset proc 
    
        mov cx,0
mov dx,0

 dddd:
 mov ah,0ch
 mov al,00h
 mov bh,00h
 int 10h
 
 inc cx
 mov ax,cx
 sub ax,5
 cmp ax,0320d   ;SIZE
 jng dddd
 
 mov cx,5
 inc dx
 mov ax,dx
 sub ax,5d
 cmp ax,10d
 jng dddd 
call drawBoundary
	
	Print 1,1,score
	Print_val 1,7,score_val
	Print 1,16,level
	Print_val 1,22,level_val
    	Print 1,28,lives
	Heart 1,34
	Heart 1,36
	Heart 1,38
	call Bricks 
;mlcall Boundry    
mov bally , 165			
mov ballx ,155 

mov ogbally , 165
mov ogballx , 155

mov strikerx , 128
mov strikery , 180
mov strikeAfter , 188
mov stSize , 60

 mov Xspeed , 02h
mov Yspeed , 03h

mov random , 0
mov heartcount,3

mov widths  , 310d
mov heights , 175d  

mov lifecount , 0
mov count , 0

mov score_val, 0
mov rem , 0

mov b1 , 1
mov b2 , 1
mov b3 , 1 
mov b4 , 1
mov b5 , 1
mov b6 , 1
mov b7 , 1
mov b8 , 1
mov b9 , 1
mov b10 , 1
mov b11 , 1
mov b12 , 1
mov b13 , 1
mov b14 , 1
mov b15 , 1 
mov b16 , 1
mov b17 , 1
mov b18 , 1
mov b19 , 1
mov b20 , 1

mov cb1 , 1
mov cb2 , 1
mov cb3 , 1 
mov cb4 , 1
mov cb5 , 1
mov cb6 , 1
mov cb7 , 1
mov cb8 , 1
mov cb9 , 1
mov cb10 , 1
mov cb11 , 1
mov cb12 , 1
mov cb13 , 1
mov cb14 , 1
mov cb15 , 1 
 mov cb16 , 1
mov cb17 , 1
mov cb18 , 1
mov cb19 , 1
mov cb20 , 1    
    
reset endp

;================== BOUNDARY ==========================

drawBoundary proc

    mov color,9    

    ;------TOP------------

    mov startx,0
    mov endx,320
    mov starty,22
    mov endy,24
    call draw

    ;------Sides------------

    mov startx,-5
    mov endx,3
    mov starty,0
    mov endy,200
    call draw

    ;------BOTTOM------------

    mov startx,0
    mov endx,320
    mov starty,190
    mov endy,200
    call draw 


   
    ret

drawBoundary endp 
;=========================SCOREEEEE===========================

DispScore proc
    
    ;score_val

    
    
    mov cx,0
mov dx,0

 dddd:
 mov ah,0ch
 mov al,00h
 mov bh,00h
 int 10h
 
 inc cx
 mov ax,cx
 sub ax,5
 cmp ax,0320d   ;SIZE
 jng dddd
 
 mov cx,5
 inc dx
 mov ax,dx
 sub ax,5d
 cmp ax,10d
 jng dddd 
       
    Print 1,1,score
	;Print_val 1,7,score_val
	Print 1,16,level
	Print_val 1,22,level_val
     Print 1,28,lives
     ;Print_val 1,34,heartcount   
      call DispHeart
       
 mov ah,00
    mov al,score_val
    mov bl,10
    div bl
    mov rem,ah

    mov ah, 02h
    mov dh, 1  ; dh is x coordinate
    mov dl, 8  ; dl is y coordinate
    int 10h

    mov dl, al
    add dl,48
    mov ah, 2h
    int 21h
    
     mov ah, 02h
    mov dh, 1  ; dh is x coordinate
    mov dl, 9  ; dl is y coordinate
    int 10h

    mov dl,rem
    add dl,48
    mov ah,02h
    int 21h
 ret   
DispScore endp
;=======================Display Hearts=======================

DispHeart Proc
  
 ; mov ah,ogheartcount
 ;.if(heartcount!=ah)
 ;clear
 ;mov ah,heartcount
 ;ml 1mov ogheartcount,ah 
 ;call drawBoundary
 ;call Bricks
 ;call checkbrick	
	;Print 1,1,score
	;call DispScore
	;Print 1,16,level
	;Print_val 1,22,level_val
    	;Print 1,28,lives
    	 
 .if(heartcount==3) 
 Heart 1,34
 Heart 1,36
 Heart 1,38 
 ret	

 .elseif(heartcount==2) 
 Heart 1,36
 Heart 1,38
 ret
                      
 .elseif(heartcount==1)
 Heart 1,38
 ret
 
 .elseif(heartcount<0)
 
  Print 1,34,empty
 ret
 
 
 .endif
 ret
 
DispHeart endp 


;=======================BRICKS===================

Bricks proc

mov color,2
Brick brick1x,brick1y
Brick brick6x,brick6y
Brick brick20x,brick20y
Brick brick17x,brick17y

mov color,1110b
Brick brick2x,brick2y
Brick brick9x,brick9y
Brick brick10x,brick10y
Brick brick15x,brick15y

mov color,1011b
Brick brick3x,brick3y
Brick brick8x,brick8y
Brick brick14x,brick14y
Brick brick19x,brick19y

mov color,1101b
Brick brick4x,brick4y
Brick brick7x,brick7y
Brick brick12x,brick12y
Brick brick18x,brick18y

mov color,4
Brick brick5x,brick5y
Brick brick11x,brick11y
Brick brick13x,brick13y
Brick brick16x,brick16y

ret
Bricks endp
;================================================

BrickCheck proc
    
;------------------Layer Zero --------------------- 

    
.if(ballx >= 30 && ballx <= 65 && bally >=30 && bally <= 40)

dec b1

.if(cb1 == 1)

.if( b1 == 0 )
dec cb1
mov color , 0
inc count 
Brick brick1x,brick1y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb1
 


.elseif(b1 < 0)
mov color , 0 
Brick brick1x,brick1y
jmp nextb1

.elseif(b1>3)
Brick brick1x,brick1y
neg Yspeed

.else
Brick brick1x,brick1y
add score_val,2
call DispScore
neg Yspeed
.endif

.endif

nextb1:

.elseif(ballx >= 30 && ballx <= 65 && bally >=50 && bally <= 60)

dec b2

.if(cb2 == 1)

.if(b2 == 0 )
dec cb2
mov color , 0
inc count 
Brick brick2x,brick2y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb2 

.elseif(b2 < 0)
mov color , 0 
Brick brick2x,brick2y
jmp nextb2

.elseif(b2>3)
Brick brick2x,brick2y
neg Yspeed

.else
Brick brick2x,brick2y
add score_val,2
call DispScore
neg Yspeed
.endif

.endif

nextb2:

.elseif(ballx >= 30 && ballx <= 65 && bally >=70 && bally <= 80)

dec b3

.if(cb3 == 1)

.if(b3 == 0 )
dec cb3
mov color , 0
inc count 
Brick brick3x,brick3y
add score_val,3 
call DispScore
neg Yspeed
jmp nextb3 

.elseif(b3 < 0)
mov color , 0 
Brick brick3x,brick3y
jmp nextb3

.elseif(b3>3)
Brick brick3x,brick3y
neg Yspeed

.else
Brick brick3x,brick3y
add score_val,2
call DispScore
neg Yspeed
.endif

.endif

nextb3:

.elseif(ballx >= 30 && ballx <= 65 && bally >=90 && bally <= 100 )

dec b4

.if(cb4 == 1)

.if(b4 == 0 )
dec cb4
mov color , 0
inc count 
Brick brick4x,brick4y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb4 

.elseif(b4 < 0)
mov color , 0 
Brick brick4x,brick4y
jmp nextb4

.elseif(b4>3)
Brick brick4x,brick4y
neg Yspeed

.else
Brick brick4x,brick4y
add score_val,2
call DispScore
neg Yspeed

.endif

.endif

nextb4:

;------------------First Layer -----------------------

.elseif(ballx >= 80 && ballx <= 115 && bally >=30 && bally <= 40 )

dec b5

.if (cb5 == 1)

.if(b5 == 0 )
dec cb5
mov color , 0
inc count 
Brick brick5x,brick5y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb5 

.elseif(b5 < 0)
mov color , 0 
Brick brick5x,brick5y
jmp nextb5

.elseif(b5>3)
Brick brick5x,brick5y
neg Yspeed

.else
Brick brick5x,brick5y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif

nextb5:

.elseif(ballx >= 80 && ballx <= 115 && bally >=50 && bally <= 60 )
                                                                 
dec b6

.if(cb6 == 1)
.if(b6 == 0 )
dec cb6
mov color , 0
inc count 
Brick brick6x,brick6y
add score_val,3 
call DispScore
neg Yspeed
jmp nextb6 

.elseif(b6 < 0)
mov color , 0 
Brick brick6x,brick6y
jmp nextb6

.elseif(b6>3)
Brick brick6x,brick6y
neg Yspeed

.else
Brick brick6x,brick6y
add score_val,2 
call DispScore
neg Yspeed

.endif
.endif

nextb6:

.elseif(ballx >= 80 && ballx <= 115 && bally >=70 && bally <= 80 )

dec b7

.if(cb7 == 1)
.if(b7 == 0 )
dec cb7
mov color , 0
inc count 
Brick brick7x,brick7y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb7 

.elseif(b7 < 0)
mov color , 0 
Brick brick7x,brick7y
jmp nextb7

.elseif(b7>3)
Brick brick7x,brick7y
neg Yspeed 
 
.else
Brick brick7x,brick7y
add score_val,2  
call DispScore
neg Yspeed

.endif
.endif

nextb7:

.elseif(ballx >= 80 && ballx <= 115 && bally >=90 && bally <= 100 )

dec b8

.if(cb8 == 1)
.if(b8 == 0 )
dec cb8
mov color , 0
inc count 
Brick brick8x,brick8y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb8 

.elseif(b8 < 0)
mov color , 0 
Brick brick8x,brick8y
jmp nextb8

.elseif(b8>3)
Brick brick8x,brick8y
neg Yspeed

.else
Brick brick8x,brick8y
add score_val,2 
call DispScore
neg Yspeed

.endif
.endif
nextb8:

;------------------Second Layer ---------------------

.elseif(ballx >= 130 && ballx <= 165 && bally >=30 && bally <= 40 )

dec b9

.if(cb9 == 1)
.if(b9 == 0 )
dec cb9
mov color , 0
inc count 
Brick brick9x,brick9y
add score_val,3 
call DispScore
neg Yspeed
jmp nextb9 

.elseif(b9 < 0)
mov color , 0 
Brick brick9x,brick9y
jmp nextb9

.elseif(b9>3)
Brick brick9x,brick9y
neg Yspeed

.else
Brick brick9x,brick9y
add score_val,2 
call DispScore
neg Yspeed

.endif
.endif
nextb9:

.elseif(ballx >= 130 && ballx <= 165 && bally >=50 && bally <= 60 )

dec b10

.if(cb10 == 1)
.if(b10 == 0 )
dec cb10
mov color , 0
inc count 
Brick brick10x,brick10y
add score_val,3 
call DispScore
neg Yspeed
jmp nextb10 

.elseif(b10 < 0)
mov color , 0 
Brick brick10x,brick10y
jmp nextb10

.elseif(b10>3)
Brick brick10x,brick10y
neg Yspeed

.else
Brick brick10x,brick10y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb10:

.elseif(ballx >= 130 && ballx <= 165 && bally >=70 && bally <= 80 )

dec b11

.if(cb11 == 1)
.if(b11 == 0 )
dec cb11
mov color , 0
inc count 
Brick brick11x,brick11y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb11 

.elseif(b11 < 0)
mov color , 0 
Brick brick11x,brick11y
jmp nextb11

.elseif(b11>3)
Brick brick11x,brick11y
neg Yspeed

.else
Brick brick11x,brick11y
add score_val,2 
call DispScore
neg Yspeed

.endif
.endif
nextb11:

.elseif(ballx >= 130 && ballx <= 165 && bally >=90 && bally <= 100 )

dec b12

.if(cb12 == 1)
.if(b12 == 0 )
dec cb12
mov color , 0
inc count 
Brick brick12x,brick12y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb12 

.elseif(b12 < 0)
mov color , 0 
Brick brick12x,brick12y
jmp nextb12

.elseif(b12>3)
Brick brick12x,brick12y
neg Yspeed

.else
Brick brick12x,brick12y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb12:


;----------------- Third Layer -----------------------

.elseif(ballx >= 180 && ballx <= 215 && bally >=30 && bally <= 40 )

dec b13

.if(cb13 == 1)
.if(b13 == 0 )
dec cb13
mov color , 0
inc count 
Brick brick13x,brick13y
add score_val,3 
call DispScore
neg Yspeed
jmp nextb13 

.elseif(b13 < 0)
mov color , 0 
Brick brick13x,brick13y
jmp nextb13

.elseif(b13>3)
Brick brick13x,brick13y
neg Yspeed

.else
Brick brick13x,brick13y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb13:


.elseif(ballx >= 180 && ballx <= 215 && bally >=50 && bally <= 60 )

dec b14

.if(cb14 == 1)
.if(b14 == 0 )
dec cb14
mov color , 0
inc count 
Brick brick14x,brick14y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb14 

.elseif(b14 < 0)
mov color , 0 
Brick brick14x,brick14y
jmp nextb14

.elseif(b14>3)
Brick brick14x,brick14y
neg Yspeed

.else
Brick brick14x,brick14y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb14:


.elseif(ballx >= 180 && ballx <= 215 && bally >=70 && bally <= 80)

dec b15

.if(cb15 == 1)
.if(b15 == 0 )
dec cb15
mov color , 0
inc count 
Brick brick15x,brick15y
add score_val,3 
call DispScore
neg Yspeed
jmp nextb15 

.elseif(b15 < 0)
mov color , 0 
Brick brick15x,brick15y
jmp nextb15

.elseif(b15>3)
Brick brick15x,brick15y
neg Yspeed

.else
Brick brick15x,brick15y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb15:


.elseif(ballx >= 180 && ballx <= 215 && bally >=90 && bally <= 100 )

dec b16

.if(cb16 == 1)
.if(b16 == 0 )
dec cb16
mov color , 0
inc count 
Brick brick16x,brick16y
add score_val,3 
call DispScore
neg Yspeed
jmp nextb16 

.elseif(b16 < 0)
mov color , 0 
Brick brick16x,brick16y
jmp nextb16

.elseif(b16>3)
Brick brick13x,brick13y
neg Yspeed

.else
Brick brick16x,brick16y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb16:


;----------------- Fourth Layer ----------------------

.elseif(ballx >= 230 && ballx <= 265 && bally >=30 && bally <= 40)

dec b17

.if(cb17 == 1)
.if(b17 == 0 )
dec cb17
mov color , 0
inc count 
Brick brick17x,brick17y
add score_val,3 
call DispScore
neg Yspeed
jmp nextb17 

.elseif(b17 < 0)
mov color , 0 
Brick brick17x,brick17y
jmp nextb17

.elseif(b17>3)
Brick brick17x,brick17y
neg Yspeed

.else
Brick brick17x,brick17y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb17:

.elseif(ballx >= 230 && ballx <= 265 && bally >=50 && bally <= 60)

dec b18

.if(cb18 == 1)
.if(b18 == 0 )
dec cb18
mov color , 0
inc count 
Brick brick18x,brick18y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb18 

.elseif(b18 < 0)
mov color , 0 
Brick brick18x,brick18y
jmp nextb18

.elseif(b18>3)
Brick brick18x,brick18y
neg Yspeed

.else
Brick brick18x,brick18y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb18:

.elseif(ballx >= 230 && ballx <= 265 && bally >=70 && bally <= 80 )

dec b19

.if(cb19 == 1)
.if(b19 == 0 )
dec cb19
mov color , 0
inc count 
Brick brick19x,brick19y
add score_val,3 
call DispScore
neg Yspeed
jmp nextb19 

.elseif(b19 < 0)
mov color , 0 
Brick brick19x,brick19y
jmp nextb19

.elseif(b19>3)
Brick brick19x,brick19y
neg Yspeed

.else
Brick brick19x,brick19y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb19:

.elseif(ballx >= 230 && ballx <= 265 && bally >=90 && bally <= 100)

dec b20

.if(cb20 == 1)
.if(b20 == 0 )
dec cb20
mov color , 0
inc count 
Brick brick20x,brick20y
add score_val,3
call DispScore 
neg Yspeed
jmp nextb20 

.elseif(b20 < 0)
mov color , 0 
Brick brick20x,brick20y
jmp nextb20

.elseif(b20>3)
Brick brick20x,brick20y
neg Yspeed

.else
Brick brick20x,brick20y
add score_val,2
call DispScore
neg Yspeed

.endif
.endif
nextb20:
           
.else

.endif

mov al,0
mov al,count
cmp al,20
;je endgame

ret
BrickCheck endp

;=======================STRIKER==================

Striker proc



push bx
push cx
Strike 14
call draw




LL1:
mov ah,01H
int 16h 

jz AFTER
      
      
mov ah,0
int 16h

CMP Ah, 4BH
JE GO_LEFT
CMP Ah, 4DH
JE GO_RIGHT
JMP AFTER
 
GO_RIGHT:

.if(strikerx >245)
jmp AFTER

.elseif
 
;--REMOVING--          
Strike 0
call draw
;------------

;--NEW-----
NewStrikeR 14
call draw
.endif
JMP  AFTER
;-----------

GO_LEFT:

.if(strikerx <17)
jmp AFTER



.elseif
 
;--REMOVING--          
Strike 0
call draw
;------------

;--NEW-----
NewStrikeL 14
call draw
JMP  AFTER
;-----------

.endif


AFTER:


pop bx
pop cx
ret


Striker endp 

;=======================BALL=====================
 Baller proc

mov cx,ballx
mov dx,bally

 ddd1:
 mov ah,0ch
 mov al,00h
 mov bh,00h
 int 10h
 
 inc cx
 mov ax,cx
 sub ax,ballx
 cmp ax,05h   ;SIZE
 jng ddd1
 
 mov cx,ballx
 inc dx
 mov ax,dx
 sub ax,bally
 cmp ax,05h
 jng ddd1
  
 ret 
 Baller endp
;---------- DRAW BALL ----------------

Ball proc


mov cx,ballx
mov dx,bally

 ddd:
 mov ah,0ch
 mov al,0fh
 mov bh,00h
 int 10h
 
 inc cx
 mov ax,cx
 sub ax,ballx
 cmp ax,05h   ;SIZE
 jng ddd
 
 mov cx,ballx
 inc dx
 mov ax,dx
 sub ax,bally
 cmp ax,05h
 jng ddd
 

;Pixel bally,ballx

;inc bally
;inc bally
;Pixel bally,ballx

;inc ballx
;Pixel bally,ballx

;dec ballx
;dec ballx
;Pixel bally,ballx
;
;dec ballx
;dec bally
;Pixel bally,ballx

;dec bally
;Pixel bally,ballx

;dec bally
;Pixel bally,ballx

;dec bally
;inc ballx
;Pixel bally,ballx

;inc ballx
;Pixel bally,ballx

;inc ballx
;Pixel bally,ballx

;inc ballx
;inc bally
;Pixel bally,ballx

;inc bally
;Pixel bally,ballx

;inc bally
;Pixel bally,ballx

;dec ballx
;dec ballx
;dec bally

ret 

Ball endp

;-------------- BALL MOVEMENT ----------------

MovBall proc


mov ax ,Xspeed
sub ballx, ax

cmp ballx,5d
JL decx

mov ax,widths
cmp ballx,ax
jg decx


mov ax,Yspeed
sub bally,ax


cmp bally,28d
JL decy

mov ax,heights
cmp bally,ax
jg pedal

ret


decx:
neg Xspeed
ret


decy:
neg Yspeed
ret 

pedal:

mov ax,ballx
add ax,10

.if(strikerx<=ax)
sub ax,15 
.if(strikeAfter>=ax)
neg Yspeed
ret
 .else
 jmp resett
 .endif
.else

.endif


resett:
;jmp decy
mov ax,ogballx
mov ballx,ax
mov ax,ogbally
mov bally,ax
neg Yspeed
dec heartcount
call DispScore

ret

MovBall endp

;==============================File Handling========================


FileHandling proc

call Create_File
call Write_File
call Read_File

FileHandling endp

;=============================

Create_File Proc

;-------Create A File------

mov ah,3ch
lea dx,fname
mov cl,0
int 21h
mov fhandle,ax

;-------Close A File-------

mov ah,3eh
mov bx,fhandle
int 21h

jmp exit

ret 

Create_File endp

;=============================

Write_File Proc

;-------Open A File------

mov ah,3dh
lea dx,fname
mov al,2			; For reading & writing
int 21h
mov fhandle,ax


;-------Write in File------

mov ah,40h
mov bx,fhandle
lea dx,msg
mov cx,lengthof msg		; Number of Characters to Write
int 21h

;-------Close A File-------

mov ah,3eh
mov bx,fhandle
int 21h

Write_File endp

;==============================

Read_File Proc

;------Read File-------
mov ah,3fh
lea dx,msg
mov cx,lengthof msg
mov bx,fhandle
int 21h

;------Display File------
lea dx,msg
mov ah,09h
int 21h

Read_File endp

;====================

;========================================================


exit:
mov ah,4ch
int 21h
end