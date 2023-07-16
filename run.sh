#!/bin/bash

/srv/install.sh

mcPath=$(cat /srv/settings.json | jq -r .url | sed "s/^.*\///" | sed "s/.zip//")

echo "Starting Minecraft... $mcPath"
cd /server/$mcPath
echo "eula=true" > eula.txt

bash startserver.sh
