#!/bin/bash

# clear out any potential stale folders in /tmp
rm -rf /tmp/*

# clone picon repository
git clone https://github.com/picons/picons-source.git /usr/src/picons-source

# build picons
cd /usr/src/picons-source
/bin/bash 2-build-picons.sh snp-full
