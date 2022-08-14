#!/bin/dash
export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

## Test_01
if test -d '.girt'
then
	rm -rf '.girt'
fi 

set -x 


##
girt-init
## Test 1: Test that girt-add properly adds files. 
echo "hello" > one
girt-add one  

if test ! -f ./.girt/index/one 
then
	echo "Fail: File 'a' not in index folder"
	exit 1
elif test "$(cat ./.girt/index/one)" != "hello" 
then
	echo "Fail: file 'a' contains wrong string."
	exit 1
fi  

## Test 2: Add non-existant file.
if test -d ./two 
then
	rm -f two 
fi 

girt-add two
if test -f ./.girt/index/two
then
	echo "Fail : girt-add added non-existant file 'b'"
	rm -f ./.girt/index/two 
	exit 1
fi 

rm -f one
girt-add one 
if test -f ./.girt/index/one
then 
	echo "girt-add did not remove file 'one' from index"
	exit 1
fi 

echo "All tests passed"

rm -rf .girt
rm -rf one two 

