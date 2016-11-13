#!/bin/bash

# clear out any potential stale folders in /tmp
rm -rf /tmp/*

# clone picon repository
git clone https://github.com/picons/picons-source.git /usr/src/picons-source

# copy backgrounds.conf to build-input
cp /backgrounds.conf /usr/src/picons-source/build-input/

# build picons
cd /usr/src/picons-source
/bin/bash 2-build-picons.sh snp-full
