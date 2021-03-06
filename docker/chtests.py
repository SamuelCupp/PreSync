#!/usr/bin/python3
import os, sys, re

for f in os.listdir("arrangements"):
    for f2 in os.listdir("arrangements/"+f):
        full = "arrangements/"+f+"/"+f2+"/test"
        if not os.path.exists(full):
            continue
        try:
            for t in os.listdir(full):
                if not re.match(r'.*\.par$',t):
                    continue
                test = full+"/"+t
                save = full+"/."+t+".sav"
                if os.path.exists(save):
                    fd = open(save,"r")
                    contents = fd.read()
                    fd.close()
                else:
                    fd = open(test,"r")
                    contents = fd.read()
                    fd.close()
                    fd = open(save,"w")
                    fd.write(contents)
                    fd.close()
                for a in sys.argv[1:]:
                    g = re.match(r'^(\s*(\w+)::(\w+)*)\s*=\s*(.*\S)',a)
                    if g:
                        pat = re.compile(r'(?mi)^'+g.group(1)+r'\s*=.*')
                        if re.search(pat,contents):
                            contents = re.sub(pat,a,contents)
                        elif re.search(r'\b'+g.group(2)+r'\b',contents):
                            contents += '\n'+a
                    elif a == "Boundary2":
                        contents = re.sub(r'\bBoundary\b','Boundary2',contents, flags=re.IGNORECASE)
                        contents = re.sub(r'\bBoundary::radpower\b','Boundary2::radpower',contents, flags=re.IGNORECASE)
                    elif a == "Boundary":
                        contents = re.sub(r'\bBoundary2\b','Boundary',contents, flags=re.IGNORECASE)
                        contents = re.sub(r'\bBoundary2::radpower\b','Boundary::radpower',contents, flags=re.IGNORECASE)
                fd = open(test,"w")
                fd.write(contents)
                fd.close()
        except Exception as ex:
            print(full,ex)
