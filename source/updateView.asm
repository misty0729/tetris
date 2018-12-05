update_view:
    ADDSP FF
    SW_SP R7 0
    //TODO:把graph里的数据发给VGA显示，只显示前20*10，后面可能有值（自己加的假结点）但是不会显示
    //这段代码有点长，寄存器不够用，把R1 R2 R3压栈_(:з」∠)_
    ADDSP FF        
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0

    LI R3 0     //R3存储对应的屏幕位置（VGA用）
    LI R4 board_size     //R4是计数器，为0时跳出
    LI R5 board_col_size     //R5是第二层计数器
    LI R6 graph //R6存储当前的格子在graph里的地址
    update_view_loop:
        //通知VGA要显示该格子
        LW R6 R0 0  //把格子图像load到R0里面
        MOVE R1 R0  //显示左半边
        SRL R1 R1 0 
        LI R2 FF
        AND R2 R1
        LI R1 BF
        SLL R1 R1 0 
        SW R1 R3 4
        SW R1 R2 5
        ADDIU R3 1
        LI R2 FF    //显示右半边
        AND R2 R0
        LI R1 BF
        SLL R1 R1 0 
        SW R1 R3 4
        SW R1 R2 5
        ADDIU R3 1
        //通过比较列号来判断是否能到达下一行
        ADDIU R5 FF
        BNEZ R5 NONEWLINE //不用换行
        NOP
        LI R5 board_col_size
        LI R1 3C      //从这一行的最后一个格子到下一行的第一个格子的VGA的坐标差80-20=60
        ADDU R3 R1 R3 //VGA坐标跳到下一行的第一个格子
        NONEWLINE:
            ADDIU R4 FF  //计数器减1
            ADDIU R6 1   //格子地址加1
            BNEZ R4 update_view_loop
            NOP

    LW_SP R3 0  //把R1 R2 R3取回来
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    RETURN