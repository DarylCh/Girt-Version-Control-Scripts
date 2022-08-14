#!/bin/dash
./girt-init

seq -f "line %.0f" 1 7 >a
seq -f "line %.0f" 1 7 >b
seq -f "line %.0f" 1 7 >c
seq -f "line %.0f" 1 7 >d
./girt-add a b c d
./girt-commit -m commit-0
./girt-branch b1
./girt-checkout b1
seq -f "line %.0f" 0 7 >a
seq -f "line %.0f" 1 8 >b
seq -f "line %.0f" 1 7 >e
./girt-add e
./girt-commit -a -m commit-1
./girt-checkout master

sed -i 4d c
seq -f "line %.0f" 0 8 >d
seq -f "line %.0f" 1 7 >f
./girt-add f
./girt-commit -a -m commit-2

./girt-merge b1 -m merge1

# ./girt-log

# ./girt-status


