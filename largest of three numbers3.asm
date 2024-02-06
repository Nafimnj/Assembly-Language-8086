input macro p1
    mov ah,1
    int 21h
    mov p1,al
endm

output macro p2
    mov ah,2
    mov dl,p2
    int 21h
endm

include 'emu8086.inc'
.model small
.stack 100h
.code
    main proc
        print 'Input 1st number:'
        printn 
        input bh
        printn 
        print 'Input 2nd number:'
        printn
        input bl
        printn
        print 'Input 3rd number:'
        printn 
        input cl
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
        output bh                       ;print bh
        call endit                      ;
        
        bl_greaterthan_bh:
        cmp bl,cl
        jge bl_greaterthan_cl
        jmp cl_greaterthan_bl
        
        bl_greaterthan_cl:             ;
        print 'The largest number is: ';
        output bl                      ;print bl
        call endit                     ;
        
        cl_greaterthan_bl:
        cmp cl,bh
        jge cl_greaterthan_bh
        jmp bh_greaterthan_cl
        
        
        cl_greaterthan_bh:             ;
        print 'The largest number is: ';
        output cl                      ;print cl
        call endit                     ;

        
        main endp
    
        proc endit    ;
            mov ah,4ch;
            int 21h   ;endit proc
        ret           ;
        endit endp    ;

end main
              
      
      
      
      
      
      
      
      
      
      
      
      
      
      
        
 
        
        
        