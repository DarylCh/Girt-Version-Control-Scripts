#!/bin/dash 
export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

if test -d '.girt'
then
	rm -rf '.girt'
fi

set -x

## testing girt-branch

girt-init
girt-branch
## test the branches folder not existant

if test -d ./.girt/branches
then 
	echo "Fail: branches folder should not be initialised."
	exit 1
fi

touch one 
girt-add one 
girt-commit -m First
girt-branch b1

if test ! -d ./.girt/branches
then
	echo "Fail: branches folder failed to initialise."
	exit 1
elif test ! -f ./.girt/branches/master
then 
	echo "Fail: master branch was not created."
	exit 1
elif test ! -f ./.girt/branches/b1
then 
	echo "Fail: branch 'b1' was not created."
	exit 1
fi 

girt-branch
# branches 'master' and 'b1' should appear

echo "Success. All tests passed"
rm -rf '.girt'
rm -f one 