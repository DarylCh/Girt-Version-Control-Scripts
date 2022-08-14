#!/bin/dash

## Test_00, This test checks the .girt-init function and if it is working 
## and adding the proper directories. Also checks that the it doesn't create
## a new .girt folder if one already exists. 

export PATH="/import/glass/3/z5078401/21t1/cs2041/Assignment01:$PATH"

## delete .girt folder if it exists
if test -d .girt 
then 
	rm -rf .girt
fi

set -x 

girt-init 

## Test that the girt repository exists. Fail if doesnt. 
if test ! -d ./.girt 
then 
	echo "Error, .girt directory not found."
	exit 1
## Checks that the commit folders exist.
elif test ! -d ./.girt/repository
then 
	echo "Error, .girt directory not found."
	exit 1
## Checks that the index folders exist.
elif test ! -d ./.girt/index
then 
	echo "Error, .girt directory not found."
	exit 1

fi

## Should display an error message. 
girt-init 

echo "All tests passed"
rm -rf .girt
