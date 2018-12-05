NOP
LI R4 f0
SLL R4 R4 0
ADDIU R4 0
    MTSP R4                 
    ADDSP FF                
    SW_SP R6 0
    ADDSP FF
    SW_SP R7 0
LI R7 0
SLL R7 R7 0
ADDIU R7 b
JALR R7
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 10
JALR R7
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 15
JALR R7
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 1a
JALR R7
NOP
NOP
    LI R6 8             
    ADDSP FF
    SW_SP R6 0     
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 24
JALR R7
NOP
    LW_SP R6 0
    ADDIU R6 FF
    SW_SP R6 0
    BEQZ R6 82
    NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 2e
JALR R7
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 33
JALR R7
NOP
    CMPI R0 10            
    BTEQZ 85
    NOP
    CMPI R0 11            
    BTEQZ c
    NOP
    CMPI R0 12            
    BTEQZ 60
    NOP
    CMPI R0 13            
    BTEQZ 25
    NOP
    CMPI R0 14            
    BTEQZ 3e
    NOP
    B 7db
    NOP
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 4a
JALR R7
NOP
LI R4 e0
SLL R4 R4 0
ADDIU R4 0
    ADDU R4 R3 R4       
    LW R4 R5 0
    ADDSP FF     
    SW_SP R3 0     
    MOVE R3 R5
LI R7 0
SLL R7 R7 0
ADDIU R7 57
JALR R7
NOP
    BNEZ R0 2
    NOP
    LW_SP R3 0
NOP
    ADDSP 1
LI R7 0
SLL R7 R7 0
ADDIU R7 61
JALR R7
NOP
    B 7bc
    NOP
NOP
    CMPI R2 0           
    BTEQZ b8
    NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 6c
JALR R7
NOP
    ADDIU R2 FF
    ADDIU R1 FF
LI R7 0
SLL R7 R7 0
ADDIU R7 73
JALR R7
NOP
    BNEZ R0 3   
    NOP
    ADDIU R2 1
    ADDIU R1 1
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 7d
JALR R7
NOP
    B 7a0
    NOP
NOP
    CMPI R2 6           
    BTEQZ 9c
    NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 88
JALR R7
NOP
    ADDIU R2 1
    ADDIU R1 1
LI R7 0
SLL R7 R7 0
ADDIU R7 8f
JALR R7
NOP
    BNEZ R0 3
    NOP
    ADDIU R2 FF
    ADDIU R1 FF
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 99
JALR R7
NOP
    B 784
    NOP
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 a1
JALR R7
NOP
    BNEZ R0 f9    
    NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 a8
JALR R7
NOP
    B 775
    NOP
NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 b0
JALR R7
NOP
    BNEZ R0 6            
    NOP
LI R7 0
SLL R7 R7 0
ADDIU R7 b7
JALR R7
NOP
NOP
    B 761
    NOP
NOP
    ADDSP 1 
    LW_SP R7 0     
    ADDSP 1
    LW_SP R6 0
    ADDSP 1
    JR R7
    NOP
NOP
LI R6 c0
SLL R6 R6 0
ADDIU R6 0
    ADDIU R6 FA 
LI R4 0
SLL R4 R4 0
ADDIU R4 a
NOP
        LI R5 0             
        SW R6 R5 0
        ADDIU R4 FF
        BEQZ R4 4
        NOP
        ADDIU R6 1
        B 7f8
        NOP
NOP
LI R6 c0
SLL R6 R6 0
ADDIU R6 0
LI R4 0
SLL R4 R4 0
ADDIU R4 c8
    ADDU R6 R4 R6
LI R4 0
SLL R4 R4 0
ADDIU R4 a
NOP
        LI R5 1
        SW R6 R5 0
        ADDIU R4 FF
        BEQZ R4 4
        NOP 
        ADDIU R6 1
        B 7f8
        NOP
NOP
JRRA
NOP
NOP
    ADDSP FF        
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0
LI R5 0
SLL R5 R5 0
ADDIU R5 14
LI R6 c0
SLL R6 R6 0
ADDIU R6 0
NOP
LI R4 0
SLL R4 R4 0
ADDIU R4 a
        LI R2 1             
NOP
            LW R6 R1 0      
            BNEZ R1 2
            NOP
            LI R2 0
NOP
                ADDIU R4 FF
                ADDIU R6 1
                BEQZ R4 f7
                NOP
        BNEZ R2 11
        NOP
NOP
            ADDIU R5 FF
            BEQZ R5 3
            NOP
            B 7ea
            NOP
NOP
    LW_SP R3 0  
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    LI R0 0
JRRA
NOP
NOP
    MOVE R5 R6 
    ADDIU R5 FA 
LI R2 c0
SLL R2 R2 0
ADDIU R2 0
    SUBU R6 R2 R2
    ADDIU R2 1  
NOP
        LW R5 R1 0
        SW R6 R1 0  
        ADDIU R2 FF 
        BEQZ R2 5
        NOP
        ADDIU R6 FF
        ADDIU R5 FF
        B 7f7
        NOP
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 30
JALR R7
NOP
        B 7dd
        NOP
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 38
JALR R7
NOP
    ADDSP FF        
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0
    MOVE R4 R0          
    LI R5 4             
LI R6 c0
SLL R6 R6 0
ADDIU R6 0
    LI R1 21            
    ADDIU R6 R1 R6
    ADDIU R6 R1 R6      
    LI R3 10            
NOP
        LI R1 1
        AND R1 R4       
        SRL R4 R4 1
        LW R6 R2 0      
        BEQZ R1 5    
        NOP
        BEQZ R2 3    
        NOP
        B 16      
        NOP  
NOP
            ADDIU R5 FF
            BNEZ R5 no_change_line
            NOP
            ADDIU R6 FA     
            LI R5 4
NOP
                ADDIU R6 FF
                ADDIU R3 FF
                BNEZ R3 eb
                NOP
NOP
    LW_SP R3 0  
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    LI R0 1
JRRA
NOP
NOP
    LW_SP R3 0  
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    LI R0 0
JRRA
NOP
NOP
    ADDSP FF        
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0
    LI R5 4             
LI R6 c0
SLL R6 R6 0
ADDIU R6 0
    LI R1 21            
    ADDIU R6 R1 R6
    ADDIU R6 R1 R6      
    LI R3 10            
NOP
        LI R2 0 
        SW R6 R2 0      
NOP
            ADDIU R5 FF
            BNEZ R5 3
            NOP
            ADDIU R6 FA     
            LI R5 4
NOP
                ADDIU R6 FF
                ADDIU R3 FF
                BNEZ R3 11
                NOP
    LW_SP R3 0  
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    LI R0 1
JRRA
NOP
NOP
LI R6 c0
SLL R6 R6 0
ADDIU R6 0
LI R4 0
SLL R4 R4 0
ADDIU R4 c8
NOP
        LI R5 0
        SW R6 R5 0
        ADDIU R4 FF
        BEQZ R4 4
        NOP
        ADDIU R6 1
        B 7f8
        NOP
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 ad
JALR R7
NOP
JRRA
NOP
NOP
    LI R4 FF
    SLL R4 R4 0
    ADDIU R4 FF     
NOP
        ADDIU R4 FF   
        BNEZ R4 fd
        NOP
JRRA
NOP
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 bf
JALR R7
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 c4
JALR R7
NOP
JRRA
NOP
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 cc
JALR R7
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 d1
JALR R7
NOP
JRRA
NOP
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 d9
JALR R7
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 de
JALR R7
NOP
JRRA
NOP
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 e6
JALR R7
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 eb
JALR R7
NOP
JRRA
NOP
NOP
LI R7 1
SLL R7 R7 0
ADDIU R7 f3
JALR R7
NOP
LI R4 0
SLL R4 R4 0
ADDIU R4 a
    ADDU R1 R4 R1           
LI R7 1
SLL R7 R7 0
ADDIU R7 fc
JALR R7
NOP
    BEQZ R0 9
    NOP
LI R7 2
SLL R7 R7 0
ADDIU R7 3
JALR R7
NOP
    LI R0 1
JRRA
NOP
NOP
LI R4 0
SLL R4 R4 0
ADDIU R4 a
    SUBU R1 R4 R1           
LI R7 2
SLL R7 R7 0
ADDIU R7 10
JALR R7
NOP
LI R7 2
SLL R7 R7 0
ADDIU R7 15
JALR R7
NOP
    LI R0 0
JRRA
NOP
NOP
LI R4 d0
SLL R4 R4 0
ADDIU R4 0
    ADDU R4 R3 R4
    LW R4 R0 0
JRRA
NOP
NOP
LI R4 88    
SLL R4 R4 0             
ADDIU R4 c0
LI R5 D0
SLL R5 R5 0
SW R5 R4 0
LI R4 E8    
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 C4    
SLL R4 R4 0
ADDIU R4 40
ADDIU R5 1
SW R5 R4 0
LI R4 2E    
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 44    
SLL R4 R4 0
ADDIU R4 c0
ADDIU R5 1
SW R5 R4 0
LI R4 8e    
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 c8    
SLL R4 R4 0
ADDIU R4 80
ADDIU R5 1
SW R5 R4 0
LI R4 e2    
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 4e    
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 8c    
SLL R4 R4 0
ADDIU R4 80
ADDOI R5 1
SW R5 R4 0
LI R4 e4    
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 4c    
SLL R4 R4 0
ADDIU R4 40
ADDIU R5 1
SW R5 R4 0
LI R4 4c    
SLL R4 R4 0
ADDIU R4 80
ADDIU R5 1
SW R5 R4 0
LI R4 C6    
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 8c  
SLL R4 R4 0
ADDIU R4 40
ADDIU R5 1
SW R5 R4 0
LI R4 6c 
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 88 
SLL R4 R4 0
ADDIU R4 88
ADDIU R5 1
SW R5 R4 0
LI R4 f0 
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 CC    
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
NOP
LI R5 E0
SLL R5 R5 0
LI R4 1
SW R5 R4 0  
ADDIU R5 1
LI R4 2
SW R5 R4 0  
ADDIU R5 1
LI R4 3
SW R5 R4 0  
ADDIU R5 1
LI R4 0
SW R5 R4 0 
ADDIU R5 1
LI R4 5
SW R5 R4 0 
ADDIU R5 1
LI R4 6 
SW R5 R4 0 
ADDIU R5 1
LI R4 7
SW R5 R4 0 
ADDIU R5 1
LI R4 4
SW R5 R4 0 
ADDIU R5 1
LI R4 9
SW R5 R4 0 
ADDIU R5 1
LI R4 A
SW R5 R4 0 
ADDIU R5 1
LI R4 B
SW R5 R4 0 
ADDIU R5 1
LI R4 8
SW R5 R4 0 
ADDIU R5 1
LI R4 D 
SW R5 R4 0 
ADDIU R5 1
LI R4 C 
SW R5 R4 0 
ADDIU R5 1
LI R4 f
SW R5 R4 0 
ADDIU R5 1
LI R4 E 
SW R5 R4 0 
ADDIU R5 1
LI R4 11
SW R5 R4 0 
ADDIU R5 1
LI R4 10
SW R5 R4 0 
ADDIU R5 1
LI R4 12
SW R5 R4 0 
JRRA
NOP
NOP
    LI R5 BF
    SLL R5 R5 0
    LW R5 R0 6
JRRA
NOP
NOP
    LI R1 4 
    LI R2 4 
    LI R3 0 
LI R7 2
SLL R7 R7 0
ADDIU R7 c3
JALR R7
NOP
NOP
    ADDSP FF        
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0
    LI R3 0     
LI R4 0
SLL R4 R4 0
ADDIU R4 c8
LI R5 0
SLL R5 R5 0
ADDIU R5 a
LI R6 c0
SLL R6 R6 0
ADDIU R6 0
NOP
        LW R6 R0 0  
        MOVE R1 R0  
        SRL R1 R1 0 
        LI R2 FF
        AND R2 R1
        LI R1 BF
        SLL R1 R1 0 
        SW R1 R3 4
        SW R1 R2 5
        ADDIU R3 1
        LI R2 FF    
        AND R2 R0
        LI R1 BF
        SLL R1 R1 0 
        SW R1 R3 4
        SW R1 R2 5
        ADDIU R3 1
        ADDIU R5 FF
        BNEZ R5 6 
        NOP
LI R5 0
SLL R5 R5 0
ADDIU R5 a
        LI R1 3C      
        ADDU R3 R6 R3 
NOP
            ADDIU R4 FF  
            ADDIU R6 1   
            BNEZ R4 e2
            NOP
    LW_SP R3 0  
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
JRRA
NOP
NOP
LI R7 2
SLL R7 R7 0
ADDIU R7 1
JALR R7
NOP
    ADDSP FF        
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0
    MOVE R4 R0          
    LI R5 4             
LI R6 c0
SLL R6 R6 0
ADDIU R6 0
    LI R1 21            
    ADDIU R6 R1 R6
    ADDIU R6 R1 R6      
    LI R3 10            
NOP
        LI R1 1
        AND R1 R4       
        SRL R4 R4 1
        LI R2 0 
        BEQZ R1         
        NOP
LI R2 b0
SLL R2 R2 0
ADDIU R2 b1
NOP
        SW R6 R2 0      
NOP
            ADDIU R5 FF
            BNEZ R5 3
            NOP
            ADDIU R6 FA     
            LI R5 4
NOP
                ADDIU R6 FF
                ADDIU R3 FF
                BNEZ R3 ea
                NOP
    LW_SP R3 0  
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    LI R0 1
JRRA
NOP
