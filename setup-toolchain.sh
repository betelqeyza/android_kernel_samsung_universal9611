#!/bin/bash
set -e
if [ ! -e toolchain ]; then
    echo 'mkdir toolchain'
    mkdir toolchain
elif [ ! -d toolchain ]; then
    echo '$(pwd)/toolchain is not a directory'
    exit 1
fi
echo 'Setting up toolchain in $(pwd)/toolchain'
cd toolchain
echo 'Download antman and sync'
bash <(curl -s "https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman") -S=latest
echo 'Patch for glibc'
bash <(curl -s "https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman") --patch=glibc
echo 'Done'
cd ../