include 'emu8086.inc'
.model small
.stack 100h
.data   
    ans db 0
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov bh,0
        mov bl,10 
        
        input:
        mov ah,1 
        int 21h   ;al=49(1)
        
        cmp al,13 
        jne calc
        je exit      
        
        calc:
        mov cl,al ;cl=49(1)
        mov al,ans ;al=0
        mul bl    ;al(0)=al(0)*bl(10)
        add al,cl ;al(49(1))=al(0)+cl(49(1))
        mov ans,al;ans=1(49)
        sub ans,48;ans=49-48=1
        jmp input 
        
        exit:
        mov ah,4ch
        int 21h
        
         
    