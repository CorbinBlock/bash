#!/bin/bash
sudo -u postgres -H -- psql -c "
DELETE FROM bankozk
WHERE recordid IN (SELECT recordid
              FROM (SELECT recordid,
	                   ROW_NUMBER() OVER (partition BY amount, description, balance ORDER BY loaddate) AS rnum
     	              FROM bankozk) t
		      WHERE t.rnum > 1);


"
