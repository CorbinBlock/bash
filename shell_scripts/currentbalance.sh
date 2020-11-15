#!/bin/bash
sudo -u postgres -H -- psql -c "
SELECT 
'credit' AS account, 
'amex' AS accttype, 
amount as currentbalance 
FROM currentBalanceAmex() 

UNION ALL 
SELECT 
'debit' as account, 
'bankozk' as accttype, 
balance as currentbalance 
from currentBalanceBankOZK()

"
