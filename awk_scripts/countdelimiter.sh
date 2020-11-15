#!/bin/bash
#2020-11-15 WCB
awk -F'|' '{print NF; exit}' stores.dat 