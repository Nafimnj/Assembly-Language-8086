include 'emu8086.inc'
.model small
.stack 100h
.code
    main proc
        print 'Input 1st number:'
        mov ah,1
        int 21h
        mov bh,al
        printn
         
        print 'Input 2nd number:'
        mov ah,1
        int 21h
        mov bl,al
        printn
        
        print 'Input 3rd number:' 
        mov ah,1
        int 21h
        mov cl,al 
        printn
        
        cmp bh,bl
        jge bh_greaterthan_bl
        jmp bl_greaterthan_bh
        
        bh_greaterthan_bl:
        cmp bh,cl
        jge bh_greaterthan_cl
        jmp cl_greaterthan_bh
      
        bh_greaterthan_cl:              ;
        print 'The largest number is: ' ;
        mov ah,2                        ;
        mov dl,bh                       ;
        int 21h                         ;
                                        ;print bh
        mov ah,4ch                      ;
        int 21h                         ;
        
        bl_greaterthan_bh:
        cmp bl,cl
        jge bl_greaterthan_cl
        jmp cl_greaterthan_bl
        
        bl_greaterthan_cl:              ;
        print 'The largest number is: ' ;
        mov ah,2                        ;
        mov dl,bl                       ;
        int 21h                         ;
                                        ;print bl
        mov ah,4ch                      ;
        int 21h                         ;
        
        cl_greaterthan_bl:
        cmp cl,bh
        jge cl_greaterthan_bh
        jmp bh_greaterthan_cl
        
        
        cl_greaterthan_bh:              ;
        print 'The largest number is: ' ;
        mov ah,2                        ;
        mov dl,cl                       ;
        int 21h                         ;
                                        ;print cl
        mov ah,4ch                      ;
        int 21h                         ;

        
        

end main
              
      
      
      
      
      
      
      
      
      
      
      
      
      
      
        
 
        
        
        