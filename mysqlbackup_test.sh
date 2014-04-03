#!/bin/bash
/usr/bin/find /backup/db/* -mtime +7 -exec rm {} \;
for db in 'ls -1 /var/lib/mysql'
do
echo "Bezig met: $db"
mysqldump --opt -u $username -$password $db | gzip > /backup/db/$db.sql_'date -I'
done