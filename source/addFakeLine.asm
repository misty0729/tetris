add_fake_line:
    ADDSP FF
    SW_SP R7 0
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
        LI R5 1
        SW R6 R5 0
        ADDIU R4 FF
        BEQZ R4 last_loop_end
        NOP 
        ADDIU R6 1
        B last_loop
        NOP
    last_loop_end:
    RETURN
