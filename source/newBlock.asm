get_new_block:
    ADDSP FF
    SW_SP R7 0
    LI R1 3 //固定起始地址是4
    LI R2 3
    ADDU R3 R7 R3
    LI R4 F
    AND R3 R4
    ADDIU R3 3
    CALL write_block    //新出现的方块要画出来
    RETURN