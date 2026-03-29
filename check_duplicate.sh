#!/bin/bash
# Checks for duplicate files with different casing in the git tree

nonunique=`git ls-tree -r HEAD --name-only | tr '[:lower:]' '[:upper:]' | sort`
unique=`git ls-tree -r HEAD --name-only | tr '[:lower:]' '[:upper:]' | sort -u`

count_nonunique=`echo "$nonunique" | wc -l`
count_unique=`echo "$unique" | wc -l`

if [[ $count_nonunique != $count_unique ]];
then
    echo "ERROR: Duplicate files detected. Remove the duplicates for the following files:"
    echo "`comm -3 <(echo "$nonunique") <(echo "$unique")`"
    exit 1
fi
