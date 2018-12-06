get_new_block:
    ADDSP FF
    SW_SP R7 0
    LI R1 3 //固定起始地址是4
    LI R2 3
    LI R3 4
    CALL write_block    //新出现的方块要画出来
    RETURN