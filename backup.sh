#!/bin/bash
mcContainer=$(docker ps | grep minecraft-forge | sed "s/  minecraft.*//")


echo "Pausing container..."
docker pause $mcContainer

echo "Copying data"
cp -r server/Server-Files-1.0.22/world/ server/backup/

echo "Resuming container..."
docker unpause $mcContainer


echo "Creating zip..."
date=$(date)
zip -r "server/backup/world-$date.zip" server/backup/world

echo "Removing backup world director now that we have a zip..."
rm -rf server/backup/world

echo "Backup complete"
