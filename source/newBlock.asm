get_new_block:
    ADDSP FF
    SW_SP R7 0
    LI R1 3 //固定起始地址是4
    LI R2 3
    LI R3 4
    CALL check_valid
    BEQZ R0 game_over
    NOP
    CALL write_block    //新出现的方块要画出来
    RETURN

game_over:

    LI R5 BF                        // DEBUG
    SLL R5 R5 0
    LI R6 2
    SLL R6 R6 0
    ADDIU R6 1c
    SW R5 R6 4
    LI R6 81
    SW R5 R6 5


    LI R5 BF                        // G
    SLL R5 R5 0
    LI R6 F4
    SW R5 R6 4
    LI R6 47
    SW R5 R6 5

    LI R6 F5                        //A
    SW R5 R6 4
    LI R6 41
    SW R5 R6 5

    LI R6 F6                        //M
    SW R5 R6 4
    LI R6 4D
    SW R5 R6 5

    LI R6 F7                        //E
    SW R5 R6 4
    LI R6 45
    SW R5 R6 5

    LI R6 1                       //O
    SLL R6 R6 0
    ADDIU R6 44
    SW R5 R6 4
    LI R6 4F
    SW R5 R6 5

    LI R6 1                       //V
    SLL R6 R6 0
    ADDIU R6 45
    SW R5 R6 4
    LI R6 56
    SW R5 R6 5

    LI R6 1                       //E
    SLL R6 R6 0
    ADDIU R6 46
    SW R5 R6 4
    LI R6 45
    SW R5 R6 5

    LI R6 1                       //R
    SLL R6 R6 0
    ADDIU R6 47
    SW R5 R6 4
    LI R6 52
    SW R5 R6 5

    B QUIT
    NOP