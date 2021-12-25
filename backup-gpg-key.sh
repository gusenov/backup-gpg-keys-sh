#!/usr/bin/env bash

set -x  # echo on

# Usage:
#
#  To make things easier, files are often named by their key id.
#
#  $ ./backup-gpg-key.sh "YOUR_FINGERPRINT" "YOUR_KEY_ID"
#   $ ./backup-gpg-key.sh "43E9 1CE0 D41D 9A02 0BBB  33B8 8E44 26F3 8FBF E1F9" "0x8E4426F38FBFE1F9"
#   $ ./backup-gpg-key.sh "A9D5 C537 665E 2036 14E8  D750 20AB AC2D 9BE7 9C98" "0x20ABAC2D9BE79C98"
#
#  $ ./backup-gpg-key.sh "username@email" "YOUR_KEY_ID"
#   $ ./backup-gpg-key.sh "gusenov@live.ru" "0x8E4426F38FBFE1F9"
#   $ ./backup-gpg-key.sh "gussenov@pm.me" "0x20ABAC2D9BE79C98"

look="$1"
name="$2"

# The gpg flags --export and --gen-revoke are examples of gpg commands; they tell gpg what to do. 
# To tell gpg how to do things, you can often precede your commands with options. 
# Both --armor and --output are examples of gpg options; they tell gpg to write its output in the Armored ASCII format and to write to a file rather than the standard output, respectively. 
# The --output option requires you to specify a filename (with or without full path), but the --armor option has no arguments.
#
# Armored ASCII (whose filename suffix is .asc) is the most portable data format gpg uses, in contrast to gpg's default binary format (which uses the filename suffix .gpg). 
# Unlike this binary format, Armored ASCII can be copied and pasted, into e-mail for example. 
# If saved to disk, an Armored ASCII file is identical to a normal text file. For this reason you'll probably wish to use Armored ASCII most of the time when exporting, backing up and transmitting keys.

# public
gpg --armor --output "$name-public-key.asc" --export-options backup --export "$look" 
gpg         --output "$name-public-key.gpg" --export-options backup --export "$look" 

# private
gpg --armor --output "$name-private-key.asc" --export-options backup --export-secret-keys "$look" 
gpg         --output "$name-private-key.gpg" --export-options backup --export-secret-keys "$look" 

