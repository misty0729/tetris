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
    LI R6 26
    SW R5 R6 4
    LI R6 47
    SW R5 R6 5

    LI R6 27                        //A
    SW R5 R6 4
    LI R6 41
    SW R5 R6 5

    LI R6 28                        //M
    SW R5 R6 4
    LI R6 4D
    SW R5 R6 5

    LI R6 29                        //E
    SW R5 R6 4
    LI R6 45
    SW R5 R6 5

    LI R6 76                       //O
    SW R5 R6 4
    LI R6 4F
    SW R5 R6 5

    LI R6 77                       //V
    SW R5 R6 4
    LI R6 56
    SW R5 R6 5

    LI R6 78                       //E
    SW R5 R6 4
    LI R6 45
    SW R5 R6 5

    LI R6 79                       //R
    SW R5 R6 4
    LI R6 52
    SW R5 R6 5

    B QUIT
    NOP