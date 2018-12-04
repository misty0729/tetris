get_new_block:
    LI R1 4 //固定起始地址是4
    LI R2 4 
    LI R3 0 //暂定固定是0状态
    CALL write_block    //新出现的方块要画出来