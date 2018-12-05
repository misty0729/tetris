clear_screen:
    ADDSP FF
    SW_SP R7 0
    LI R6 graph
    LI R4 board_size    //计数器，将整个棋盘置为0之后显示一下
    clear_loop:
        LI R5 0
        SW R6 R5 0
        ADDIU R4 FF
        BEQZ R4 clear_loop_end
        NOP
        ADDIU R6 1
        B clear_loop
        NOP

    clear_loop_end:
        CALL update_view
        RETURN