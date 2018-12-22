#!/bin/bash

DATE=`date +"%Y-%m-%d-%H-%M"`
cp nanocd /usr/local/bin/nanocd
cd ~/projects/bash_test/
git checkout -b $DATE
touch ${DATE}_test.txt
git add .
git add *
git commit -m $DATE
git push
