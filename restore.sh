#!/bin/bash


# Restore the public and secret keyrings and trust database
cp ./backups/pubring.gpg ~/.gnupg/
cp ./backups/secring.gpg ~/.gnupg/

#cp ./backups/trustdb.gpg ~/.gnupg/
# or, if you exported the ownertrust
gpg --import-ownertrust ./backups/ownertrust-gpg.txt

