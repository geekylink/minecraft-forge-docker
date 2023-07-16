#!/bin/bash

ForgeURL=$(cat /srv/settings.json | jq -r .url)
zipFile=$(cat /srv/settings.json | jq -r .url | sed "s/^.*\///")

if [ -f /server/installed ]; then
	thisVersion=$(grep $ForgeURL /server/installed)

	echo "multi-server host detected, checking if $ForgeURL is installed." 	
	if [ "$thisVersion" == "$ForgeURL"  ] ; then
		echo "Server already installed, skipping install..."
		exit 0
	fi
	echo "Not installed."

fi

#echo "wget"
wget -P /server $ForgeURL
cd /server
unzip $zipFile

# Don't install again
echo $ForgeURL > /server/installed
