init_state:
ADDSP FF
SW_SP R7 0
LI R4 89    //第一个状态 1000 1000 1100 0000
SLL R4 R4 0             
ADDIU R4 c0
LI R5 D0
SLL R5 R5 0
SW R5 R4 0
LI R4 E8    //第二个状态 1110 1000 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 C4    //第三个状态 1100 0100 0100 0000
SLL R4 R4 0
ADDIU R4 40
ADDIU R5 1
SW R5 R4 0
LI R4 2E    //第四个状态 0010 1110 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 45    //第五个状态 0100 0100 1100 0000
SLL R4 R4 0
ADDIU R4 c0
ADDIU R5 1
SW R5 R4 0
LI R4 8e    //第六个状态 1000 1110 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 c9    //第七个状态 1100 1000 1000 0000
SLL R4 R4 0
ADDIU R4 80
ADDIU R5 1
SW R5 R4 0
LI R4 e2    //第八个状态 1110 0010 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 4e    //第九个状态 0100 1110 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 8d    //第十个状态 1000 1100 1000 0000
SLL R4 R4 0
ADDIU R4 80
ADDIU R5 1
SW R5 R4 0
LI R4 e4    //第十一个状态 1110 0100 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 4c    //第十二个状态 0100 1100 0100 0000
SLL R4 R4 0
ADDIU R4 40
ADDIU R5 1
SW R5 R4 0
LI R4 4d    //第十三个状态 0100 1100 1000 0000
SLL R4 R4 0
ADDIU R4 80
ADDIU R5 1
SW R5 R4 0
LI R4 C6    //第十四个状态 1100 0110 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 8c  //第十五个状态 1000 1100 0100 0000
SLL R4 R4 0
ADDIU R4 40
ADDIU R5 1
SW R5 R4 0
LI R4 6c //第十六个状态 0110 1100 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 89 //第十七个状态 1000 1000 1000 1000
SLL R4 R4 0
ADDIU R4 88
ADDIU R5 1
SW R5 R4 0
LI R4 f0 //第十八个状态 1111 0000 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
LI R4 CC    //第十九个状态 1100 1100 0000 0000
SLL R4 R4 0
ADDIU R5 1
SW R5 R4 0
init_next_state:
LI R5 E0
SLL R5 R5 0
LI R4 1
SW R5 R4 0  // 0 : 1
ADDIU R5 1
LI R4 2
SW R5 R4 0  // 1 : 2
ADDIU R5 1
LI R4 3
SW R5 R4 0  // 2 : 3
ADDIU R5 1
LI R4 0
SW R5 R4 0 //  3 : 0
ADDIU R5 1
LI R4 5
SW R5 R4 0 //  4 : 5
ADDIU R5 1
LI R4 6 
SW R5 R4 0 //  5 : 6
ADDIU R5 1
LI R4 7
SW R5 R4 0 //  6 : 7
ADDIU R5 1
LI R4 4
SW R5 R4 0 // 7 : 4
ADDIU R5 1
LI R4 9
SW R5 R4 0 // 8 : 9
ADDIU R5 1
LI R4 A
SW R5 R4 0 // 9 : A
ADDIU R5 1
LI R4 B
SW R5 R4 0 // A : B 
ADDIU R5 1
LI R4 8
SW R5 R4 0 // B : 8 
ADDIU R5 1
LI R4 D 
SW R5 R4 0 // C : D 
ADDIU R5 1
LI R4 C 
SW R5 R4 0 // D : C
ADDIU R5 1
LI R4 f
SW R5 R4 0 // E : F 
ADDIU R5 1
LI R4 E 
SW R5 R4 0 // F : E 
ADDIU R5 1
LI R4 11
SW R5 R4 0 // 10 : 11
ADDIU R5 1
LI R4 10
SW R5 R4 0 // 11 : 10
ADDIU R5 1
LI R4 12
SW R5 R4 0 // 12 : 12
RETURN

