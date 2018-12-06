clear_block:
    ADDSP FF
    SW_SP R7 0
    //TODO:将R1 R2 R3表示的方块从graph里清除
    //大体从writeBlock复制粘贴过来的_(:з」∠)_
    CALL get_now_state  //得到表示状态的16位bit
   LI R5 BF                        // DEBUG
    SLL R5 R5 0
    LI R6 88
    SW R5 R6 4
    SW R5 R6 5

    ADDSP FF        //这段也不够用QAQ
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0

    MOVE R4 R0          //把值挪出来,R4存状态，16位0/1
    LI R5 4             //存一下相对列号，从最后一个格子开始
    LI R6 graph         //R6存储相应格子对应到graph里的地址
    ADDU R6 R1 R6      //当前指向开始一个格子
    LI R1 21            //一个block第一个格子和最后一个格子的位置差（相对于整个棋盘来说）3*10+3=33=0X21
    ADDU R6 R1 R6      //当前指向最后一个格子
    LI R3 10            //计数器，循环16次
    clear_loop:
        LI R1 1
        AND R1 R4       //R1代表当前格子有没有
        SRL R4 R4 1
        BEQZ R1 prepare_for_next_clear
        NOP
        LI R2 0 
        SW R6 R2 0      //R6是该格子对应在graph里的位置，因为是清空，所以直接写0就完事儿了
        
        prepare_for_next_clear:
            ADDIU R5 FF
            BNEZ R5 no_change_line_clear
            NOP
            ADDIU R6 FA     //这一行的第一个到上一行的最后一个，位置要-6
            LI R5 4
            no_change_line_clear:
                ADDIU R6 FF
                ADDIU R3 FF
                BNEZ R3 clear_loop
                NOP

   LI R5 BF                        // DEBUG
    SLL R5 R5 0
    LI R6 89
    SW R5 R6 4
    SW R5 R6 5

    LW_SP R3 0  //把R1 R2 R3取回来
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    RETURN