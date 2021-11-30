#!/bin/sh

# 참고 : https://www.lesstif.com/dbms/mysqldump-db-backup-load-17105804.html

# Absolute path to directory for backup files
DIR_SAVE="/home/xxxx/backup/mysql/save"
if [ ! -d $DIR_SAVE ]; then
	mkdir -m 755 -p $DIR_SAVE
fi

MYSQL_USER="root"
MYSQL_PASSWORD="password"
MYSQL_HOST="x.x.x.x"
MYSQL_PORT=3306
MYSQL_TABLE="xxxx"

FILE_DUMP="${DIR_SAVE}/${MYSQL_TABLE}_$(date +'%Y%m%d_%H%M%S').sql"

# 데이터 제외(테이블 구조만 백업)
#mysqldump --user=$MYSQL_USER --password=$MYSQL_PASSWORD --host=$MYSQL_HOST --port=$MYSQL_PORT --default-character-set=utf8 --protocol=tcp --column-statistics=FALSE --routines --events --no-data --single-transaction --databases $MYSQL_TABLE > $FILE_DUMP
# 데이터 포함
mysqldump --user=$MYSQL_USER --password=$MYSQL_PASSWORD --host=$MYSQL_HOST --port=$MYSQL_PORT --default-character-set=utf8 --protocol=tcp --column-statistics=FALSE --routines --events --single-transaction --databases $MYSQL_TABLE > $FILE_DUMP
gzip $FILE_DUMP
