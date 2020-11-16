#!/bin/bash
filename=$1
awk 'BEGIN { FS = "\"" } ; {print $2}' $filename 
awk 'BEGIN { FS = "\">" } ; {print $3}' $filename 