#!/bin/bash

mkdir build > /dev/null

cd bootloader/
nasm -o ../build/boot boot.asm
bootresult=$?
cd ..

if [ $bootresult -eq "0" ]
then
    echo "Build finished successfully"
else
    echo "Build failed with error code $bootresult. See output for more info."

    exit 1
fi

cd ..
