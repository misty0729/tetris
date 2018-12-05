freefall:
    ADDSP FF
    SW_SP R7 0
    //TODO:尝试自由下落一行，然后判断合法性，可以的话返回1，不行的话返回0，并将当前数据写入graph，同时要判断能否消行
    CALL clear_block    
    LI R4 board_col_size
    ADDU R1 R4 R1           
    CALL check_valid
    BEQZ R0 FALLFAILED
    NOP
    CALL write_block        //成功则绘制，返回1，结束
    LI R0 1
    RETURN
FALLFAILED:
    LI R4 board_col_size    
    SUBU R1 R4 R1           //恢复
    CALL write_block
    CALL check_get_point    //停下来了所以要判断能否消行
    LI R0 0
    RETURN          