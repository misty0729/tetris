get_new_block:
    ADDSP FF
    SW_SP R7 0
    LI R1 3 //固定起始地址是4
    LI R2 3
    ADDIU R3 7
    SLTUI R3 13
    BTNEZ not_greater_than_19
    NOP
    LI R4 13
    SUBU R3 R4 R3
    not_greater_than_19: 
    CALL check_valid
    BEQZ R0 game_over
    NOP
    CALL write_block    //新出现的方块要画出来
    LI R0 1
    RETURN
game_over:
    LI R5 BF                        // G
    SLL R5 R5 0
    LI R6 73
    SW R5 R6 4
    LI R6 47
    SW R5 R6 5

    LI R6 74                        //A
    SW R5 R6 4
    LI R6 41
    SW R5 R6 5

    LI R6 75                        //M
    SW R5 R6 4
    LI R6 4D
    SW R5 R6 5

    LI R6 76                        //E
    SW R5 R6 4
    LI R6 45
    SW R5 R6 5

    LI R6 78                       //O
    SW R5 R6 4
    LI R6 4F
    SW R5 R6 5

    LI R6 79                       //V
    SW R5 R6 4
    LI R6 56
    SW R5 R6 5

    LI R6 7a                       //E
    SW R5 R6 4
    LI R6 45
    SW R5 R6 5

    LI R6 7b                       //R
    SW R5 R6 4
    LI R6 52
    SW R5 R6 5

    LI R0 0
    RETURN