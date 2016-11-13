#!/bin/bash


# clear out any potential stale folders in /tmp
rm -rf /tmp/*

# clone picon repository
git clone https://github.com/picons/picons-source.git /usr/src/picons-source

# copy backgrounds.conf to build-input
cp /backgrounds.conf /usr/src/picons-source/build-input/

# build picons
cd /usr/src/picons-source || exit
/bin/bash 2-build-picons.sh snp-full

# copy picons archive to /picons folder
cp -f /usr/src/picons-source/build-output/binaries-snp-full/*hardlink*.tar.bz2 /picons/picons.tar.bz2
