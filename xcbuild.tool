#!/bin/bash
CONFIGURATION=DEBUG

source edksetup.sh
build -a X64 -p MaxRegnerPkg/MaxRegnerPkg.dsc -t XCODE5 -b $CONFIGURATION
