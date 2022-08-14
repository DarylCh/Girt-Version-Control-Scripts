#!/bin/dash 

export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

## delete .girt folder if it exists
if test -d ./.girt 
then 
	rm -rf .girt
fi

set -x 
girt-init

## Test Commit 1
touch one two 
girt-add one two 
girt-commit -m "First"

if test ! -d ./.girt/repository/commit0
then
	echo "Fail, commit 0 doesn't exist."
	exit 1
elif test ! -f ./.girt/repository/commit0/one
then
	echo "Fail, file 'one' not found in commit."
	exit 1
elif test ! -f ./.girt/repository/commit0/two
then 
	echo "Fail, file 'two' not found in commit."
	exit 1
elif ! cmp ./one ./.girt/repository/commit0/one
then
	echo "Fail, file 'one' different between working directory and commit."
	exit 1
elif ! cmp ./.girt/index/one ./.girt/repository/commit0/one
then 
	echo "Fail, file 'one' different between index and commit."
	exit 1
fi 

## Test Commit 2
echo "world" > three
girt-add three 
girt-commit -m "Second"
if test ! -d ./.girt/repository/commit1
then 
	echo "Fail, commit 1 doesn't exist."
	exit 1
elif test ! -f -d ./.girt/repository/commit1/one
then
	echo "File, file 'one' not in commit."
	exit 1
elif test ! -f -d ./.girt/repository/commit1/two
then
	echo "File, file 'two' not in commit."
	exit 1
elif test ! -f -d ./.girt/repository/commit1/three
then
	echo "File, file 'three' not in commit."
	exit 1
fi

echo "All tests passed"
rm -rf '.girt'
rm -f one two three 


