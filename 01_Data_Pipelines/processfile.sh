#!/bin/bash

mkdir -p OUTPUT
mkdir -p processed unprocessed
chmod -R 766 processed/ unprocessed

fileList=$(ls ./DATA/*.csv)

if [[ ${fileList} == '' ]]
then
    echo "No new files to process" >> error.log
    exit 1
fi

for file in ${fileList}; do
    echo $file
    /usr/local/bin/python processfile.py $file > dump.txt
    dumpContent=$(cat dump.txt)
    
    if [[ ${dumpContent} == "OK" ]]
    then
        echo "File processing OK" >> out.log
        mv ${file} processed/
    else
        mv ${file} unprocessed/
    fi 
    rm -f dump.txt
done
