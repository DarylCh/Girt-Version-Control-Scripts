#!/bin/dash 
export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

if test -d 'girt'
then
	rm -rf '.girt'
fi

set -x

girt-init
touch one 
touch two
girt-add one two 
## files one and two added to commit
girt-commit -m First

echo "Success. All tests passed"
rm -rf '.girt'
rm -f one two 

