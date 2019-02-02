#!/bin/bash

ROOT=`pwd`
VERSION=$1
if [[ "${VERSION}" -eq "DEV" ]]; then
  # Installing default version
  ./install.sh
  if [[ ! $? -eq 0 ]]; then
    exit -1;
  fi

  # Copying DEV files
  if [[ -d "${ROOT}/../../www/dist" ]]; then
    echo "Copying DEV files..."
    cp -rf ${ROOT}/../../www/dist/dist_js ${ROOT}/src/nw/cesium
    cp -rf ${ROOT}/../../www/dist/dist_css ${ROOT}/src/nw/cesium
    cp -rf ${ROOT}/../../www/img ${ROOT}/src/nw/cesium
    cp -rf ${ROOT}/../../www/lib ${ROOT}/src/nw/cesium
    cp -rf ${ROOT}/../../www/license ${ROOT}/src/nw/cesium
  fi


else

  ./install.sh $1
  if [[ ! $? -eq 0 ]]; then
    exit -1;
  fi
fi

./src/nw/nw $2 $3
