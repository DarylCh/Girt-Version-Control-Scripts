#!/bin/sh

./girt-init
seq 1 7 >7.txt
./girt-add 7.txt
./girt-commit -m commit-0
./girt-branch b1
./girt-checkout b1

perl -pi -e s/2/42/ 7.txt
./girt-commit -a -m commit-1
./girt-checkout master

perl -pi -e s/5/24/ 7.txt
./girt-commit -a -m commit-2

# girt-merge b1 -m merge-message
# # girt-merge: error: can not merge
# # $ girt-log
# # 2 commit-2
# # 0 commit-0
# # $ girt-status
# # 7.txt - same as repo
