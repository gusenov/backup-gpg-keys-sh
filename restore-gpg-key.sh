#!/usr/bin/env bash

set -x  # echo on

# Usage:
#  $ ./restore-gpg-key.sh "0x8E4426F38FBFE1F9-private-key.gpg"
#  $ ./restore-gpg-key.sh "0x20ABAC2D9BE79C98-private-key.gpg"

fullfile="$1"
filename=$(basename -- "$fullfile")

case $filename in 
	*"pub"*".gpg")
		gpg                                   --import-options restore --import "$fullfile"
	;; 
	
	*"pub"*".asc")
		gpg --armor                           --import-options restore --import "$fullfile"
	;; 
	
	*"priv"*".gpg")
		gpg         --allow-secret-key-import --import-options restore --import "$fullfile"
	;; 
	
	*"priv"*".asc")
		gpg --armor --allow-secret-key-import --import-options restore --import "$fullfile"
	;; 
esac

