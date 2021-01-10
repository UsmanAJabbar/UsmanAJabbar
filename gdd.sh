#!/usr/bin/env bash

# /**********************/
# Title: (GDD) Google Drive Downloader
# Author: Usman Abdul Jabbar Shaikh
# Description: This script allows you
#              download large files from Google
#              drive by simply offering a link to
#              your publicly available file.
# Credits: Anjan Chandra Pudel
#          https://medium.com/@acpanjan/download-google-drive-files-using-wget-3c2c025a8b99
# /**********************/

echo $#

if [ "$#" -gt 0 ]; then
	if [[ "$1" == *".google.com"* ]];
		then
			LINK="$1"
			FILENAME="$2"
			FILEID=$(echo "$LINK" | tr '/' ' ' | cut -d' ' -f6)
			DLL1="https://docs.google.com/uc?export=download&id=$FILEID"
			wget --no-check-certificate "$DLL1" -O "$FILENAME"
			# || wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=FILEID' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$FILEID" -O $FILENAME && rm -rf /tmp/cookies.txt
	else
		echo "Usage ./gdd {Google Drive Link} output_filename"
	fi
fi
