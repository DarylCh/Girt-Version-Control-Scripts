#!/bin/dash 

export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

## delete .girt folder if it exists
if test -d ./.girt 
then 
	rm -rf .girt
fi

set -x 
girt-init

touch one 
girt-add one 
girt-commit -m "First"

touch two 
girt-add two
girt-commit -m "Second"

touch three 
girt-add three
girt-commit -m "Third"

girt-log 

touch four
girt-add four 
girt-commit -m "Fourth"

touch five
girt-add five
girt-commit -m "Fifth" 

touch six
girt-add six
girt-commit -m "Sixth" 

touch seven 
girt-add seven
girt-commit -m "Seventh"

girt-log

 
echo "All tests passed"
rm -rf '.girt'
rm -f one two three four five six seven 


