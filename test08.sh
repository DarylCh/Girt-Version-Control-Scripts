#!/bin/dash 
export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

if test -d '.girt'
then
	rm -rf '.girt'
fi

set -x

## testing girt-checkout 

girt-init
touch one 
touch two
girt-add one 
## files one and two added to commit
girt-commit -m First
girt-branch b1
girt-checkout b1
if test ! -f ./.girt/branches/.curr_b1
then 
    echo "Fail: branch 'b1' not properly set to the current branch."
    exit 1
fi
girt-checkout master
if test ! -f ./.girt/branches/.curr_master
then   
    echo "Fail: branch 'master' not properly set to the current branch."
    exit 1
fi 
girt-checkout b1
girt-add two 
girt-commit -m Second
if test ! -f ./.girt/repository/commit1/one ||
   test ! -f ./.girt/repository/commit1/two
then 
    echo "Fail: commit 1 should contain files 'one' and 'two'"
    exit 1
fi

girt-checkout master
if test ! -f ./.girt/index/one
then
    echo "Fail: file 'one' missing from index"
    exit 1
elif test -f ./.girt/index/two
then 
    echo "Fail: file 'two' should not be in index"
    exit 1
fi

girt-checkout b1
if test ! -f ./.girt/index/two 
then 
    echo "Fail: file 'two' should exist in the index"
    exit 1
fi
echo "Shrek" > two
# girt-add two
girt-status
girt-checkout master
if test ! -f ./.girt/index/two
then
    echo "Fail: girt-checkout should not have swapped branches"
    exit 1
fi

echo "Success. All tests passed"
rm -rf '.girt'
rm -f one two three 





