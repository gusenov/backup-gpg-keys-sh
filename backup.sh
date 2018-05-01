#!/bin/bash


mkdir ./backups

# Backup the public and secret keyrings and trust database
cp ~/.gnupg/pubring.gpg ./backups/
cp ~/.gnupg/secring.gpg ./backups/

cp ~/.gnupg/trustdb.gpg ./backups/
# or, instead of backing up trustdb...
gpg --export-ownertrust > ./backups/ownertrust-gpg.txt
# NOTE The GPG manual suggests exporting the ownertrust instead of backing up the trustdb, although it doesn't explain why.
# http://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration.html

