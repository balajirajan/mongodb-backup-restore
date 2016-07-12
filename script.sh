#!/bin/bash

HOST=`echo $HOSTNAME`
PORT="17017"
REMOTE_DB="remoteDBname"
LOCAL_DB="localDBname"
USER="admin"
PASS="admin's password"

## Backup the remote DB 
echo "Dumping '$HOST:$PORT/$REMOTE_DB'"
mongodump --host $HOST --port $PORT --db $REMOTE_DB --u $USER --p $PASS

## Restore the remote DB
echo "Restoring to '$LOCAL_DB'..."
mongorestore --db $LOCAL_DB --drop dump/$REMOTE_DB

## REMOVE DUMP FILES
echo "Removing dump files..."
rm -r dump

echo "Done."
