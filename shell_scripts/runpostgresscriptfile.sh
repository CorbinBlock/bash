#!/bin/bash
file=$1  
sudo -u postgres -H  psql -a -f /home/ec2-user/sql/$file
