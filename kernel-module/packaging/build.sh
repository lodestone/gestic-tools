#!/bin/bash

cd $(dirname $0)/../

make clean
make

# clean cruft
rm -rf .pkg/lib/modules/*/modules.*

fpm -s dir -t deb -a armhf -n gestic-driver -v 0.0.1 --after-install packaging/kernel-postinstall.sh -C .pkg/ lib

rm -rf .pkg