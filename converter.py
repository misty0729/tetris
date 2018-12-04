import os
import sys

if len(sys.argv) < 2:
    print("filename: out")
    sys.exit(0)

# find asm
ori_files = os.listdir(".")
files = []
for name in ori_files:
    if os.path.splitext(name)[-1] == '.asm':
        print("find:" + name)
        files.append(name)

# find main
find_main = False
for filename in files:
    if filename == "main.asm":
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

# set main as start
files.remove("main.asm")
files.insert(0, "main.asm")
print(files)

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

line_list_2 = []
for line in line_list_1:
    line_idt = line.split()
    if line_idt[0] == "LI" and (line_idt[2] in DEF_MACRO):
        print("find LI MACRO")
    else:
        line_list_2.append(line)

line_list_3 = []
for line in line_list_2:
    if ':' in line:
        idt = line[0:line.find(':') + 1]
        next_line = line[line.find(':') + 1:]
        line_list_3.append(idt)
        line_list_3.append(next_line)
    else:
        line_list_3.append(line)

line_list_4 = []
for line in line_list_3:
    if not len(line.split()) == 0:
        line_list_4.append(line)

l_num = 0
for line in line_list_4:
    if ':' in line:
        idt = line[0:line.find(':')]
        idt_list[idt] = l_num
        line_list_4[l_num] = "NOP\n"
    l_num += 1

print(idt_list)

l_num = 0
for line in line_list_4:
    line_items = line.split()
    for idt in idt_list:
        if idt in line_items:
            offset = idt_list[idt] - l_num - 1
            if offset >= 0:
                line_list_4[l_num] = line.replace(idt, str(hex(offset))[2:])
            else:
                offset += 256
                if line_items[0] == "B":
                    line_list_4[l_num] = line.replace(idt, "7" + str(hex(offset))[2:])
                else:
                    line_list_4[l_num] = line.replace(idt, str(hex(offset))[2:])
            print(line_list_4[l_num])
    l_num += 1

output = ""
for line in line_list_4:
    output += line
print(output)

out_filename = sys.argv[2]
fout = open(out_filename, 'w')
fout.write(output)
