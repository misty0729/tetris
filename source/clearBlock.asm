clear_block:
    //TODO:将R1 R2 R3表示的方块从graph里清除
    //大体从writeBlock复制粘贴过来的_(:з」∠)_

    ADDSP FF        //这段也不够用QAQ
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0

    LI R5 4             //存一下相对列号，从最后一个格子开始
    LI R6 graph         //R6存储相应格子对应到graph里的地址
    LI R7 21            //一个block第一个格子和最后一个格子的位置差（相对于整个棋盘来说）3*10+3=33=0X21
    ADDIU R6 R1 R6
    ADDIU R6 R7 R6      //当前指向最后一个格子
    LI R3 10            //计数器，循环16次
    write_loop:
        LI R2 0 
        SW R6 R2 0      //R6是该格子对应在graph里的位置，因为是清空，所以直接写0就完事儿了
        
        prepare_for_next_write:
            ADDIU R5 FF
            BNEZ R5 no_change_line
            NOP
            ADDIU R6 FA     //这一行的第一个到上一行的最后一个，位置要-6
            LI R5 4
            no_change_line_write:
                ADDIU R6 FF
                ADDIU R3 FF
                BNEZ R3 write_loop
                NOP

    LW_SP R3 0  //把R1 R2 R3取回来
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    LI R0 1
    RETURN