fileName='export_'
today=$(date '+%Y%m%d')
fileExt='.csv'
fullFileName=$fileName$today$fileExt
cd /home/ec2-user/sql
chmod 777  $fullFileName

sudo -u postgres -H -- psql -c "\COPY bankozk(Date,Description,ChkRef,Amount,Balance) FROM '/home/ec2-user/sql/$fullFileName' DELIMITER ',' CSV HEADER;"
