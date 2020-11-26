#!/bin/bash
#2020-11-15 WCB
#cd to directory you want to push to Github
cd '*/bash/'

#initialize pwd as repo
git init

#create readme
touch readme.txt

#commit repo - insert your own comment for the commit
git commit -m "bash folder initial commit"

#add orgin to remote repo (URL on Github for that will host this code)
git remote add origin https://github.com/CorbinBlock/bash.git

#push this committed code to Github on the master branch
git push -u origin master
git add *object name*

#remove file from filesystem and git repository`
git rm file1.txt
git commit -m "remove file1.txt"
git add .

#print diff of local vs remote branch
git diff master origin/master
