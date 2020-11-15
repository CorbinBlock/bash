#!/bin/bash
echo "Look for flat files"
#set -x
wc -l /home/ec2-user/sql/*csv*
echo "Execute shell scripts"
allScripts=(loadbankozkstatement.sh dedupbankozk.sh )
cd /usr/local/bin/

for s in ${allScripts[@]}; do	
	 $s
done

echo "TRUNCATE mint table if new source file present"
#if[ ls /home/ec2-user/sql/*transaction.csv* | wc -l -eq	1 ]
runpostgresscript.sh "TRUNCATE TABLE mint"	
#fi

echo "Execute Postgres SPs"
allPostgres=(transformbankozk loadamex dedupamex copymint)

for p in ${allPostgres[@]}; do
	runpostgresscript.sh "CALL $p()"
	done

echo "Execute Postgres functions"

allPostgresFunction=(countdupesbankozk currentbalancebankozk currentbalanceamex)

for f in ${allPostgresFunction[@]}; do
	runpostgresscript.sh "SELECT * FROM $f()"
		        done

firstCurrentMonth=$(date '+%Y-%m-01')
currentDate=$(date '+%Y-%m-%d')
echo "Current Month Cash Flow - BankOZK"
runpostgresscript.sh "SELECT * FROM cashflowbankozkcurrentyear('2020-09-01','$currentDate')"

currentbalance.sh

runpostgresscript.sh "SELECT m.category, m.date, m.description, SUM(m.amount) AS amount, m.transactiontype FROM mint m JOIN d_date d ON m.date = d.date_actual WHERE d.month_actual = 9 AND d.year_actual = 2020 GROUP BY m.date, m.transactiontype, m.category, m.description ORDER BY m.date DESC, amount DESC "
