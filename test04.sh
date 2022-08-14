#!/bin/dash 
export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

# Testing girt-show

## delete .girt folder if it exists
if test -d ./.girt 
then 
	rm -rf .girt
fi

set -x 
girt-init

girt-init

echo one > one 
girt-add one
girt-commit -m "First"
echo two > one 
girt-add one
girt-commit -m "Second"
echo three > one 
girt-add one
girt-commit -m "Third"
echo four > one
girt-add one
girt-commit -m "Fourth"
echo five > one
girt-add one
girt-commit -m "Fifth"

one="$(girt-show 0:one)"
two="$(girt-show 1:one)"
three="$(girt-show 2:one)"
four="$(girt-show 3:one)"
five="$(girt-show 4:one)"

if test $one != "one"
then 
	echo "Fail: Commit 0 has wrong output for 'one'" 
	exit 1
elif test $two != "two"
then 
	echo "Fail: Commit 1 has wrong output for 'one'" 
	exit 1
elif test $three != "three"
then 
	echo "Fail: Commit 2 has wrong output for 'one'" 
	exit 1
elif test $four != "four"
then 
	echo "Fail: Commit 3 has wrong output for 'one'" 
	exit 1
elif test $five != "five"
then 
	echo "Fail: Commit 4 has wrong output for 'one'" 
	exit 1
fi 

echo "All tests passed"
rm -rf '.girt'
rm -f one two three four five


