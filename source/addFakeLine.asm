add_fake_line:
    ADDSP FF
    SW_SP R7 0

    ADDSP FF        //这段也不够用QAQ
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0

    LI R6 graph
    ADDIU R6 F6 
    LI R4 board_col_size
    first_loop:             //把棋盘前一行的全部置0
        LI R5 0             
        SW R6 R5 0
        ADDIU R4 FF
        BEQZ R4 first_loop_end
        NOP
        ADDIU R6 1
        B first_loop
        NOP
    first_loop_end:
    LI R6 graph
    LI R4 board_size 
    ADDU R6 R4 R6
    LI R4 board_col_size
    last_loop:              //把棋盘后一行的全部置1，代表有东西占了，方便碰撞检测
        LI R5 static_block
        SW R6 R5 0
        ADDIU R4 FF
        BEQZ R4 last_loop_end
        NOP 
        ADDIU R6 1
        B last_loop
        NOP
    last_loop_end:

    LI R3 board_start     //R3存储对应的屏幕位置（VGA用）
    ADDIU R3 AF
    LI R5 board_col_size
    ADDIU R5 2
    upper_boarder_loop:
        LI R0 static_block//把格子图像load到R0里面
        MOVE R1 R0  //显示左半边
        SRL R0 R0 0 
        LI R2 FF
        AND R2 R1
        LI R1 BF
        SLL R1 R1 0 
        SW R1 R3 4
        SW R1 R2 5
        ADDIU R3 1
        LI R2 FF    //显示右半边
        AND R2 R0
        LI R1 BF
        SLL R1 R1 0 
        SW R1 R3 4
        SW R1 R2 5
        ADDIU R3 1

        ADDIU R5 FF
        BNEZ R5 upper_boarder_loop
        NOP

    LW_SP R3 0  //把R1 R2 R3取回来
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    RETURN
