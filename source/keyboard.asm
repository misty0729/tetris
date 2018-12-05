get_keyboard:
    ADDSP FF
    SW_SP R7 0
    LI R5 BF
    SLL R5 R5 0
    LW R5 R0 6
    RETURN