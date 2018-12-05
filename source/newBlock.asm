get_new_block:
    ADDSP FF
    SW_SP R7 0
    LI R1 A //固定起始地址是4
    LI R2 0
    LI R3 7 //暂定固定是0状态
    CALL write_block    //新出现的方块要画出来
    RETURN