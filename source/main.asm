DEFINE board_row_size 0x14  //0x14=20行
DEFINE board_col_size 0xA   //0xA=10行
DEFINE board_size 0x190     //0x190=20*10=200个格子
DEFINE newline_step 0x3C    //从这一行的最后一个格子到下一行的第一个格子的VGA的坐标差80-20=60
DEFINE graph 0xC000         /从0XC000处开始存储graph每个格子的状态
DEFINE now_state 0xD000     //从0XD000处开始存储状态->到格子状态的映射
DEFINE next_state 0xE000    //从0XD000处开始存储状态->下一个状态的映射
DEFINE moving_left 0xB0     //正在移动中的方块的左半部分
DEFINE moving_right 0xB1    //正在移动中的方块的右半部分
DEFINE moving_block 0xB0B1  //正在移动中的Image
DEFINE static_left 0x82     //静止的方块的左半部分
DEFINE static_right 0x83    //静止的方块的右半部分
DEFINE static_block 0x8283  //静止的方块的Image
//约定
//R1 R2 R3作为全局变量来使用，含义下面有
//R0作为函数返回值使用
//R4 R5 R6 R7作为局部变量来使用，约定每个函数内部可以自行更改他的值（其实更好的做法是save_reg和load_reg?_(:з」∠)_)
INIT:
    ADDSP FF        //将R6和R7压栈
    SW_SP R6 0
    ADDSP FF
    SW_SP R7 0

    CALL clear_screen   //清屏
    CALL init_state     //把状态数据和下一个状态的数据写入指定位置
    CALL get_new_block  //新生成一个块作为当前块, R1存储左上角光标位置, R2存储列号, R3存储当前状态号
    CALL add_fake_line  //在graph的最后面加一行（即第21行）假的方块用来碰撞检测,以及前一行置成0
MAINLOOP:
    LI R6 8             
    ADDSP FF
    SW_SP R6 0     //此处压栈了一个循环变量，记住，根据之后的情况调整栈帧的大小
CHECKKEYBOARD:
    CALL update_view      //更新视图
    LW_SP R6 0
    ADDSP R6 FF
    SW_SP R6 0
    BEQZ R6 AUTOUPDATE
    NOP
    CALL deley_160W       //延时100W条指令
    CALL get_keyboard     //获取键盘按下的值
    CMPI R0 10            //判断是否是ESC
    BTEQZ QUIT
    NOP
    CMPI R0 11            //判断是否是上键
    BTEQZ HANDLEROTATE
    NOP
    CMPI R0 12            //判断是否是下键
    BTEQZ HANDLELSHIFT
    NOP
    CMPI R0 13            //判断是否是左键
    BTEQZ HANDLELSHIFT
    NOP
    CMPI R0 14            //判断是否是右键
    BTEQZ HANDLERSHIFT
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
    CMPI R2 6           //TODO:暂且认为当4格子的右边卡住边的时候，不能右移（实际并不是这样_(:з」∠)_）
    BTEQZ CHECKKEYBOARD
    NOP
    CALL clear_block
    ADDIU R2 1
    ADDIU R1 1
    CALL check_valid
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
    B CHECKKEYBOARD
    NOP
AUTOUPDATE:             //固定时间自动更新
    CALL freefall       //调用自由下落
    BNEZ R0 FREEFALLSUCCESS            //自由下落返回值为成功与否
    NOP
    CALL get_new_block
FREEFALLSUCCESS:
    B MAINLOOP
    NOP

QUIT:
    //TODO:开的栈给挪回去
    LW_SP R7 0     //把R6和R7赋值回去
    ADDSP 1
    LW_SP R6 0
    ADDSP 1
    JR R7
    NOP
