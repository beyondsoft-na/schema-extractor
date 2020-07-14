#!/bin/bash -x

table=$1
database_engine=$2

file1=$(ls | grep $table)
echo $file1
file2='src/test/resources/'$database_engine'_validation.schema'
echo $file2

diff -u $file1 $file2 > /dev/null

comp_value=$?

if [ $comp_value -eq 1 ]
then

    echo "schema are different"

    exit 1;
else
    echo "schema are the same"
fi

