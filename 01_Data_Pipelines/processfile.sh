#!/bin/bash

mkdir -p OUTPUT
mkdir -p processed
chmod -R 766 processed

fileList=$(ls DATA/*.csv)

for file in ${fileList}; do
    echo $file
    python processfile.py $file > dump.txt
    dumpContent=$(cat dump.txt)
    
    if [[ ${dumpContent} == "OK" ]]
    then
        echo "File processing OK"
        mv ${file} processed/
    else
        mv ${file} unprocessed/
    fi 
    rm -f dump.txt
done
