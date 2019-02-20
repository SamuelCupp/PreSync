#!/usr/bin/python

import sys

procs = int(sys.argv[1])
test = int(sys.argv[2])
failure = ""

for i in range(1,procs+1):
    f = open("test-out-"+str(i)+".txt","r")
    fail = 0
    for x in f:
        if(x == "\n"):
            continue
        if (not fail):
            if (x.find("Tests failed:") != -1):
                fail = 1
            continue
        else:
            if (x.find("==============") != -1):
                break
            failure += x

print(str(failure.count('\n')) + " " + str(test) + "-processor tests failed:")
print(failure)
