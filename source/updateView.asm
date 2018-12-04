update_view:
    //TODO:把graph里的数据发给VGA显示，只显示前20*10，后面可能有值（自己加的假结点）但是不会显示
    //这段代码有点长，寄存器不够用，把R1 R2 R3压栈_(:з」∠)_
    ADDSP FF        
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0

    
    LI R4 0     //R4存储当前要画的格子的位置
    LI R5 0     //R5存储列号
    LI R6 0     //R6存储对应的屏幕位置（VGA用）
    update_view_loop:
        //通知VGA要显示该格子
        LI R7 graph
        ADDU R7 R4 R7
        LW R7 R0 0
        MOVE R1 R0  //显示左半边
        SRL R1 R1 0 
        LI R2 FF
        AND R2 R1
        LI R1 BF
        SLL R1 R1 0 
        SW R1 R6 4
        SW R1 R2 5
        ADDIU R6 1
        LI R2 FF    //显示右半边
        AND R2 R0
        LI R1 BF
        SLL R1 R1 0 
        SW R1 R6 4
        SW R1 R2 5
        ADDIU R6 1
        //显示该格子完毕
        ADDIU R4 1  //移到下一个位置
        ADDIU R5 1
        ADDIU R6 1
        LI R7 block_col_size //通过比较列号来判断是否能到达下一行
        CMP R5 R7
        BTNEZ NONEWLINE //不用换行
        NOP
        LI R5 0
        LI R7 newline_step
        ADDU R6 R7 R6 //VGA坐标跳到下一行的第一个格子
        NONEWLINE:
            LI R7 board_size    //判断是否出了框了
            CMP R4 R7
            BTNEZ update_view_loop
            NOP

    LW_SP R3 0  //把R1 R2 R3取回来
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    RETURN