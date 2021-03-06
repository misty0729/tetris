DEFINE board_row_size 0x14  //0x14=20行
DEFINE board_col_size 0xA   //0xA=10列
DEFINE board_size 0xc8     //0xc8=20*10=200个格子
DEFINE board_start 0x10E
DEFINE graph 0xC000         /从0XC000处开始存储graph每个格子的状态
DEFINE now_state 0xD000     //从0XD000处开始存储状态->到格子状态的映射
DEFINE next_state 0xE000    //从0XE000处开始存储状态->下一个状态的映射
DEFINE user_stack 0xF000    //从0XF000处作为用户栈
DEFINE moving_left 0xB0     //正在移动中的方块的左半部分
DEFINE moving_right 0xB1    //正在移动中的方块的右半部分
DEFINE moving_block 0x9A9B  //正在移动中的Image
DEFINE static_left 0x82     //静止的方块的左半部分
DEFINE static_right 0x83    //静止的方块的右半部分
DEFINE static_block 0xE1E0  //静止的方块的Image
DEFINE tat  0x0690
//约定
//R1 R2 R3作为全局变量来使用，含义下面有，其他函数尽量不使用这三个寄存器
//R0作为函数返回值使用
//R4 R5 R6 R7作为局部变量来使用，约定每个函数内部可以自行更改他的值（其实更好的做法是save_reg和load_reg?_(:з」∠)_)
INIT:
    LI R4 user_stack        
    MTSP R4                 //初始化栈顶位置
    ADDSP FF                //将R6和R7压栈
    SW_SP R6 0
    ADDSP FF
    SW_SP R7 0

    CALL clear_screen
    CALL init_state
    LI R3 0
    CALL get_new_block  //新生成一个块作为当前块, R1存储左上角光标位置, R2存储列号, R3存储当前状态号
    CALL add_fake_line

MAINLOOP:
    LI R4 8             
    ADDSP FF
    SW_SP R4 0     //此处压栈了一个循环变量，记住，根据之后的情况调整栈帧的大小
CHECKKEYBOARD:
    CALL update_view      //更新视图
    CALL delay_40W       //延时20W条指令

    CALL get_keyboard     //获取键盘按下的值

    CMPI R0 10            //判断是否是ESC
    BTEQZ QUIT
    NOP

    CMPI R0 11            //判断是否是上键
    BTEQZ HANDLEROTATE
    NOP

    CMPI R0 13            //判断是否是下键
    BTEQZ HANDLEDOWNTO
    NOP

    CMPI R0 12            //判断是否是左键
    BTEQZ HANDLELSHIFT
    NOP

    CMPI R0 14            //判断是否是右键
    BTEQZ HANDLERSHIFT
    NOP

    LW_SP R4 0
    ADDIU R4 FF
    SW_SP R4 0
    BEQZ R4 AUTOUPDATE
    NOP

    B CHECKKEYBOARD
    NOP

HANDLEROTATE:           //处理旋转请求
    CALL clear_block
    LI R4 next_state
    ADDU R4 R3 R4       //计算出当前状态的下一个状态的存储位置
    LW R4 R5 0
    ADDSP FF     
    SW_SP R3 0     //开栈存一下R3之前的值
    MOVE R3 R5
    CALL check_valid 
    BNEZ R0 ROTATESUCCESS
    NOP
    LW_SP R3 0
ROTATESUCCESS:
    ADDSP 1
    CALL write_block
    B CHECKKEYBOARD
    NOP
HANDLELSHIFT:           //处理左移
    CMPI R2 0           //在最左边的一列，无法移动
    BTEQZ CHECKKEYBOARD
    NOP
    CALL clear_block     //先清除当前块
    ADDIU R2 FF
    ADDIU R1 FF
    CALL check_valid     
    BNEZ R0 LSHIFTSUCCESS   //合法的话直接写
    NOP
    ADDIU R2 1
    ADDIU R1 1
LSHIFTSUCCESS:
    CALL write_block
    B CHECKKEYBOARD
    NOP
HANDLERSHIFT:           //处理右移
    CALL clear_block
    ADDIU R2 1
    ADDIU R1 1
    CALL check_valid    //这里会同时检测出界
    BNEZ R0 RSHIFTSUCCESS
    NOP
    ADDIU R2 FF
    ADDIU R1 FF
RSHIFTSUCCESS:
    CALL write_block
    B CHECKKEYBOARD
    NOP
HANDLEDOWNTO:           //处理下方向键的直接落下
    CALL freefall
    BNEZ R0 HANDLEDOWNTO    //下落成功递归调用该程序
    NOP
    CALL get_new_block
    BEQZ R0 QUIT
    NOP
    B CHECKKEYBOARD
    NOP
AUTOUPDATE:             //固定时间自动更新
    CALL freefall       //调用自由下落

    BNEZ R0 FREEFALLSUCCESS            //自由下落返回值为成功与否
    NOP
    CALL get_new_block
    BEQZ R0 QUIT
    NOP
FREEFALLSUCCESS:
    ADDSP 1
    B MAINLOOP
    NOP
QUIT:
    ADDSP 1
    LW_SP R7 0     //把R6和R7赋值回去
    ADDSP 1
    LW_SP R6 0
    ADDSP 1
    JR R7
    NOP
