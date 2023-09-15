#!/bin/sh

echo "trying to restore the database (if it exists)..."
litestream restore -v -if-replica-exists /app/data/kuma.db

echo "starting replication and the application..."
litestream replicate
