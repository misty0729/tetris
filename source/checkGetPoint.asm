check_get_point:
    //TODO:检测当前的graph是否可以消行（得分），没有返回值（只判断前20行），可以消行将执行消行
    ADDSP FF        //我估计这段也不够用，先压再说_(:з」∠)_
    SW_SP R1 0
    ADDSP FF        
    SW_SP R2 0
    ADDSP FF        
    SW_SP R3 0

    LI R5 board_row_size    //循环次数
    LI R6 graph             //R6还是当前格子信息的存储位置
    check_line_loop:
        LI R4 board_col_size
        LI R2 1             //R2来标记这一行是不是满的，初值为是
        loop_in_this_line:
            LW R6 R1 0      //用R1把格子信息取出来
            BNEZ R1 prepare_for_next_square
            NOP
            LI R2 0
            prepare_for_next_square:
                ADDIU R4 FF
                ADDIU R6 1
                BEQZ R4 loop_in_this_line
                NOP
        BNEZ R2 get_point
        NOP

        prepare_for_next_check_line:
            ADDIU R5 FF
            BEQZ R5 RET
            NOP
            B check_line_loop
            NOP

RET:
    LW_SP R3 0  //把R1 R2 R3取回来
    ADDSP 1
    LW_SP R2 0  
    ADDSP 1
    LW_SP R1 0  
    ADDSP 1
    LI R0 0
    RETURN

get_point://思路是从R6倒着消到第一个
    MOVE R5 R6 
    ADDIU R5 FA //让R5是R6上一行对应的格子（TODO:边界问题即最上面一行怎么办）
    LI R2 graph
    SUBU R6 R2 R2
    ADDIU R2 1  //R2是计数器，表示要消的格子个数
    delete_loop:
        LW R5 R1 0
        SW R6 R1 0  //把上一行这个格子的信息存进这一行的这个格子
        ADDIU R2 FF //判断是否消除结束，即消到了第一个格子
        BEQZ R2 loop_end
        NOP
        ADDIU R6 FF
        ADDIU R5 FF
        B delete_loop
        NOP
    loop_end:
        CALL check_get_point
        B RET
        NOP
    