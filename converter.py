import os
import sys

if len(sys.argv) < 2:
    print("filename: out")
    sys.exit(0)

# find asm
ori_files = os.listdir("./source")
files = []
for name in ori_files:
    if os.path.splitext(name)[-1] == '.asm':
        print("find:" + "source/" + name)
        files.append("source/" + name)

# find main
find_main = False
for filename in files:
    if filename == "source/main.asm":
        find_main = True
if not find_main:
    print("No main.asm. abort.")
    sys.exit(0)

# find macros. all global
DEF_MACRO = {}
for filename in files:
    f = open(filename, encoding="utf-8")
    for line in f:
        line_idt = line.split()
        if not len(line_idt) == 0:
            if line_idt[0] == "DEFINE":
                if "0x" in line_idt[2]:
                    value = int(line_idt[2], 16)
                else:
                    value = int(line_idt[2])
                DEF_MACRO[line_idt[1]] = value
    f.close()
print("find macros: " + str(len(DEF_MACRO)))
print(DEF_MACRO)

# set main as start
files.remove("source/main.asm")
files.insert(0, "source/main.asm")

line_list_1 = []
for file in files:
    local_list_1 = []
    f = open(file, encoding="utf-8")
    for line in f:
        if '//' in line:
            line = line[0:line.find('//')] + "\n"
        if not len(line.split()) == 0:
            line_idt = line.split()
            if not line_idt[0] == "DEFINE":
                local_list_1.append(line)
    local_list_2 = []
    for line in local_list_1:
        if not len(line.split()) == 0:
            local_list_2.append(line)
    line_list_1.extend(local_list_2)
#print("size of local_list: " + str(len(line_list_1)))
#print("local_list: " + str(line_list_1))
print("local_list_2: " + str(local_list_2))
# LI MACRO
line_list_2 = []
for line in line_list_1:
    line_idt = line.split()
    if line_idt[0] == "LI" and (line_idt[2] in DEF_MACRO):
        macro_value = DEF_MACRO[line_idt[2]]
        print("MACRO: " + line_idt[2])
        print(macro_value)
        mv_hi = int(macro_value / 256)
        mv_lo = macro_value % 256
        line_list_2.append("LI " + line_idt[1] + " " + str(hex(mv_hi))[2:] + "\n")
        print(line_list_2[-1])
        line_list_2.append("SLL " + line_idt[1] + " " + line_idt[1] + " 0\n")
        print(line_list_2[-1])
        line_list_2.append("ADDIU " + line_idt[1] + " " + str(hex(mv_lo))[2:] + "\n")
        print(line_list_2[-1])
    else:
        line_list_2.append(line)

# CALL RET B
line_list_3 = []
for line in line_list_2:
    line_idt = line.split()
    if line_idt[0] == "CALL":
        line_list_3.append("LI R6 " + line_idt[1] + "\n")
        line_list_3.append("SLL R6 R6 0\n")
        line_list_3.append("ADDIU R6 " + line_idt[1] + "\n")
        line_list_3.append("MFPC R7\n")
        line_list_3.append("ADDIU R7 3\n")
        line_list_3.append("JR R6\n")
        line_list_3.append("NOP\n")
        print(line_list_3[-2])
    elif line_idt[0] == "RETURN":
        line_list_3.append("JR R7\n")
        line_list_3.append("NOP\n")
        print(line_list_3[-1])
    else:
        line_list_3.append(line)

line_list_4 = []
for line in line_list_3:
    if ':' in line:
        idt = line[0:line.find(':') + 1]
        next_line = line[line.find(':') + 1:]
        line_list_4.append(idt.lstrip())
        line_list_4.append(next_line)
    else:
        line_list_4.append(line)

line_list_5 = []
for line in line_list_4:
    if not len(line.split()) == 0:
        line_list_5.append(line)

l_num = 0
idt_list = {}
for line in line_list_5:
    if ':' in line:
        idt = line[0:line.find(':')]
        idt_list[idt] = l_num
        line_list_5[l_num] = "NOP\n"
    l_num += 1

print(idt_list)

l_num = 0
for line in line_list_5:
    line_idt = line.split()
    for idt in line_idt:
        if idt in idt_list:
            offset = idt_list[idt] - l_num - 1
            if line_idt[0] == "B":
                if offset >= 0:
                    line_list_5[l_num] = (line.replace(idt, str(hex(offset))[2:]))
                else:
                    offset += 2048
                    line_list_5[l_num] = (line.replace(idt, str(hex(offset))[2:]))
            elif line_idt[0] == "LI":
                line_list_5[l_num] = line.replace(idt, str(hex(int(l_num / 256)))[2:])
            elif line_idt[0] == "ADDIU":
                line_list_5[l_num] = line.replace(idt, str(hex(l_num % 256))[2:])
            else:
                if offset < 0:
                    offset += 256
                line_list_5[l_num] = line.replace(idt, str(hex(offset))[2:])

            # print(line_list_4[l_num])
    l_num += 1

output = ""
for line in line_list_5:
    output += line
# print(output)

out_filename = sys.argv[1]
fout = open(out_filename, 'w')
fout.write(output)
