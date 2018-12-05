delay_10W:
    ADDSP FF
    SW_SP R7 0
    LI R4 0
    SLL R4 R4 0
    ADDIU R4 FF     //R4=65535
    delay_LOOP:
        ADDIU R4 FF   
        BNEZ R4 delay_LOOP
        NOP
    RETURN

delay_20W:
    ADDSP FF
    SW_SP R7 0
    CALL delay_10W
    CALL delay_10W
    RETURN

delay_40W:
    ADDSP FF
    SW_SP R7 0
    CALL delay_20W
    CALL delay_20W
    RETURN

delay_80W:
    ADDSP FF
    SW_SP R7 0
    CALL delay_40W
    CALL delay_40W
    RETURN

delay_160W:
    ADDSP FF
    SW_SP R7 0
    CALL delay_80W
    CALL delay_80W
    RETURN

delay_320W:
    ADDSP FF
    SW_SP R7 0
    CALL delay_160W
    CALL delay_160W
    RETURN

delay_640W:
    ADDSP FF
    SW_SP R7 0
    CALL delay_320W
    CALL delay_320W
    RETURN

delay_1280W:
    ADDSP FF
    SW_SP R7 0
    CALL delay_640W
    CALL delay_640W
    RETURN

delay_2560W:
    ADDSP FF
    SW_SP R7 0
    CALL delay_1280W
    CALL delay_1280W
    RETURN