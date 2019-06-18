#!/bin/bash
FILE=/deezloaderremix/update.json
if [ -f $FILE ]; then
	echo "File $FILE exists."
	wget -O /deezloaderremix/online.json 'https://notabug.org/RemixDevs/DeezloaderRemix/raw/master/update.json' &
	wait
	instV=$(cat $FILE | jq '."version"')
	onlV=$(cat /deezloaderremix/online.json | jq '."version"')
	if [ $instV = $onlV ]; then
		echo "--- Latest Version installed ---"
		exec node /deezloaderremix/app/app.js
	else
		echo "--- Updating ---"
		rm $FILE &
		wait
	fi
fi
if [ ! -f $FILE ]; then
	echo "--- Downloading Latest Version ---"
	cd /
	rm master.zip &
	rm -R /deezloaderremix &
	wait
	wget https://notabug.org/RemixDevs/DeezloaderRemix/archive/development.zip &
	wait
	unzip development.zip &
	wait
	cd /deezloaderremix
	yarn install &
	wait
	exec node /deezloaderremix/app/app.js
fi
