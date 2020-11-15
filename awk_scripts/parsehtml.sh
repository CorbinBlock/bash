#!/bin/bash
filename=$1
awk 'BEGIN { FS = "\"" } ; {print $2}' $filename | grep http > urls.txt
awk 'BEGIN { FS = "\">" } ; {print $3}' $filename | grep " " > folders.txt