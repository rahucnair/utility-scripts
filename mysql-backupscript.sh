#!/bin/bash

DATE=$(date +"%d-%m-%Y")
DB_NAME="<DBNAME>"
FILE_NAME="${DB_NAME}-${DATE}.sql"
DB_NAME="<DBNAME>"
BACKUPLOCATION="/opt/backup"
RETENTION="15"


# Taking backup

/usr/bin/mysqldump --databases ${DB_NAME} > ${BACKUPLOCATION}/${FILE_NAME}

# Checking retention

BACKUPCOUNT=$(ls $BACKUPLOCATION/*.sql | wc -l)

if [ $BACKUPCOUNT -gt $RETENTION ]
then
find $BACKUPLOCATION/*.sql -mtime +$RETENTION -exec rm {} \;
fi
