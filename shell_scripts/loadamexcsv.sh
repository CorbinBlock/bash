#!/bin/bash
sudo -u postgres -H -- psql -c "\COPY amex(Date,Description,Amount) FROM '/home/ec2-user/sql/activity.csv' DELIMITER ',' CSV HEADER;"
