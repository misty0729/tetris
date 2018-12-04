delay_10W:
    LI R4 FF
    SLL R4 R4 0
    ADDIU R4 FF     //R4=65535
    delay_LOOP:
        ADDIU R4 FF   
        BNEZ R4 delay_LOOP
        NOP
    RETURN

delay_20W:
    CALL delay_10W
    CALL delay_10W
    RETURN

delay_40W:
    CALL delay_20W
    CALL delay_20W
    RETURN

delay_80W:
    CALL delay_40W
    CALL delay_40W
    RETURN

delay_160W:
    CALL delay_80W
    CALL delay_80W
    RETURN
