#!/bin/bash

query=$1  
sudo -u postgres -H psql --echo-all -c "$query"
