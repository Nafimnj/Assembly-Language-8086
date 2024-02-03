input macro p1
    mov ah,1
    int 21h
    mov p1,al
endm  
pri macro p2
    print "the largest number is "
    mov ah,2
    mov dl,p2
    int 21h
endm
include 'emu8086.inc'
.model small
.stack 100h
.code
main proc
    print "Input 1st number:" 
    input bh 
    printn 
    
    print "Input 2nd number:" 
    input bl 
    printn 
    
    print "Input 3rd number:" 
    input cl 
    printn  
    
    cmp bh,bl
    jge bh_cl_check
    jmp bl_cl_check
    
    bh_cl_check:
        cmp bh,cl
        jge bh_print
        jmp bl_cl_check 
        
    bl_cl_check:
        cmp bl,cl
        jge bl_print
        jmp cl_ah_check 
        
    cl_ah_check:
        cmp cl,ah
        jge cl_print
        
    bh_print:
    pri bh
    mov ah,4ch
    int 21h
    
    bl_print:
    pri bl
    mov ah,4ch
    int 21h
     
    cl_print: 
    pri cl
    mov ah,4ch
    int 21h
    
    main endp
end main
        