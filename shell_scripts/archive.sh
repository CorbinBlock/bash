#!/bin/bash

today=$(date '+%Y%m%d')
mkdir /home/ec2-user/sql/archive/$today

mv /home/ec2-user/sql/*.csv /home/ec2-user/sql/archive/$today

gzip /home/ec2-user/sql/archive/$today/*
