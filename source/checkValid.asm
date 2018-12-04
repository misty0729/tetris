check_valid:
    //判断当前R1 R2 R3的方块是否与已经放好的图(graph)有冲突
    CALL get_now_state  //得到表示状态的16位bit

    ADDSP FF        //这段也不够用QAQ
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0

    MOVE R4 R0          //把值挪出来,R4存状态，16位0/1
    LI R5 4             //存一下相对列号，从最后一个格子开始判断
    LI R6 graph         //R6存储相应格子对应到graph里的地址
    LI R7 21            //一个block第一个格子和最后一个格子的位置差（相对于整个棋盘来说）3*10+3=33=0X21
    ADDIU R6 R1 R6
    ADDIU R6 R7 R6      //当前指向最后一个格子
    LI R3 10            //计数器，循环16次
    check_valid_loop:
        LI R1 1
        AND R1 R4       //R1代表当前格子有没有
        SRL R4 R4 1
        LW R6 R2 0      //R2则是图里存着的信息    
        BEQZ R1 prepare_for_next_valid    //R1没有格子，没有冲突，准备下一个
        NOP
        BEQZ R2 prepare_for_next_valid    //R2图里这个点是空的，没有冲突，准备下一个
        NOP
        B NOTVALID      //都有，产生冲突，直接RETURN
        NOP  
        prepare_for_next_valid:
            ADDIU R5 FF
            BNEZ R5 no_change_line
            NOP
            ADDIU R6 FA     //这一行的第一个到上一行的最后一个，位置要-6
            LI R5 4
            no_change_line_valid:
                ADDIU R6 FF
                ADDIU R3 FF
                BNEZ R3 check_valid_loop
                NOP

VALID:
    LW_SP R3 0  //把R1 R2 R3取回来
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    LI R0 1
    RETURN
NOTVALID:
    LW_SP R3 0  //把R1 R2 R3取回来
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    LI R0 0
    RETURN