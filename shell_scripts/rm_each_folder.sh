#!/bin/bash
#loop through each subfolder in current directory and remove all contents
cd /insertfullpath/

find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && pwd && rm -rf *" \;

#for d in [0-9][0-9][0-9]
#do
#           ( cd "$d" && ls )
#    done