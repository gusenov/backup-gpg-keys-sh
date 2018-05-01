#!/bin/bash

set -x  # echo on

gpg --keyid-format none --list-public-keys
gpg --keyid-format short --list-public-keys
gpg --keyid-format long --list-public-keys

