#!/bin/bash -x

table=$DS_TABLE
database_engine=$DB_ENGINE

file1=$(ls | grep $table)
echo $file1
file2='src/test/resources/'$database_engine'_validation_schema'
echo $file2

diff -u $file1 $file2 > /dev/null

comp_value=$?

if [ $comp_value -eq 0 ]
then
	echo "schema are the same"
else
    echo "schema are different"
    exit 1;
fi

