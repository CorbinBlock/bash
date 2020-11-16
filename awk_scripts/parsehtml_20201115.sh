#!/bin/bash
#./parsehtml_20201115.sh bookmarks_11_15_20.html
filename=$1
awk 'BEGIN { FS = "\"" } ; {print $2}' $filename | grep http
#awk 'BEGIN { FS = "\">" } ; {print $3}' $filename | grep " "