#!/bin/dash
export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

if test -d '.girt'
then
	rm -rf '.girt'
fi

set -x

## tests for girt merge
touch one two three four five

girt-init 
girt-add one 
girt-commit -m First 
girt-add two 
girt-commit -m Second
girt-branch b1
girt-branch b2
if test ! -f ./.girt/branches/.curr_master
then 
    echo "Fail: current branch should be 'master'"
    exit 1
elif test ! -f ./.girt/branches/b1
then 
    echo "Fail: branch 'b1' not added properly"
    exit 1
elif test ! -f ./.girt/branches/b2
then 
    echo "Fail: branch 'b2' not added properly"
    exit 1
fi 
girt-checkout b1
girt-add three
girt-commit -m Third
girt-rm three

girt-checkout b2
if test -f ./.girt/index/three 
then
    echo "Fail: file 'three' was not removed successfully"
    exit 1
fi 
girt-add four
girt-commit -m Fourth
echo "Hello" > one
girt-add one five
girt-commit -m Fifth

## Testing fast forward 
girt-checkout master
girt-merge b2 -m None

if test -d ./.girt/repository/commit5
then
    echo "Fail: commit should not have been made in fast forward"
    exit 1
elif test ! -f ./.girt/index/four || 
   test ! -f ./.girt/index/five 
then
    echo "Fail: fast-forward of 'master' branch not successful"
    exit 1
elif test -f ./.girt/index/three 
then 
    echo "Fail: master branch should not contain file 'three'"
    exit 1
fi
girt-checkout b1 
if test -f ./.girt/index/four || 
   test -f ./.girt/index/five 
then
    echo "Fail: files 'four' and 'five' should not exist in the "
    echo "branch 'b1'"
    exit 1
fi

## Testing three-way merge
girt-checkout master
girt-merge b1 -m Sixth
if test ! -d ./.girt/repository/commit5
then
    echo "Fail: commit5 not created. Three way merge failed"
    exit 1
elif test ! -f ./.girt/repository/commit5/three
then
    echo "Fail: file 'three' not found. Three way merge failed"
    exit 1
elif test ! -f ./.girt/repository/commit5/one 
then
    echo "Fail: file 'one' not found. Three way merge failed"
    exit 1
elif test ! -f ./.girt/repository/commit5/two
then
    echo "Fail: file 'two' not found. Three way merge failed"
    exit 1
elif test ! -f ./.girt/repository/commit5/four
then
    echo "Fail: file 'four' not found. Three way merge failed"
    exit 1
elif test ! -f ./.girt/repository/commit5/five
then
    echo "Fail: file 'five' not found. Three way merge failed"
    exit 1
elif test "$(cat ./.girt/repository/commit5/one)" != "Hello"
then
    echo "Fail: file 'one' does not contain the correct string "
    echo "'Hello'. Three way merge failed"
    exit 1
fi

echo "All tests passed"
rm -rf '.girt'
rm -f one two three 

