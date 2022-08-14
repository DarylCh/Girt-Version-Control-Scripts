#!/bin/dash 
export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

if test -d '.girt'
then 
    rm -rf '.girt'
fi  

set -x

girt-init 

touch one
girt-add one
girt-commit -m "First"

## Test that normal rm works
girt-rm one 
if test -f .girt/index/one
then 
	echo "Fail: file 'one' still exists in index."
	exit 1 
elif test -f ./one
then
	echo "File: file 'one' still exists in working repository."
	exit 1
fi

## Test that cached works
touch two
girt-add two 
girt-commit -m "Second"
girt-rm --cached two 
if test -f .girt/index/two
then
	echo "Fail: file 'two' still exists in index."
	exit 1
elif test ! -f ./two 
then
	echo "Fail: file 'two' has been removed from working repository"
	exit 1
fi

## Test that force works
rm two 
echo "hello" > three
girt-add three
girt-commit -m "Third"
echo "world" > three
girt-add three
echo "hello" > three
girt-rm three
if test ! -f ./.girt/index/three
then
	echo "Fail: block should have happened"
	exit 1 
fi
girt-rm -forced three
if test ! -f ./.girt/index/three
then
	echo "Fail: file 'three' should have been deleted"
	exit 1 
fi

echo "Files succeeded." 
