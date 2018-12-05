get_now_state:
    ADDSP FF
    SW_SP R7 0
    LI R4 now_state
    ADDU R4 R3 R4
    LW R4 R0 0
    RETURN