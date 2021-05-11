#!/bin/sh

SCAD_FILE=$1

OPENSCAD_EXECUTABLE=./squashfs-root/AppRun
if [ ! -f ${OPENSCAD_EXECUTABLE} ]; then
    OPENSCAD_APPIMAGE=OpenSCAD-2021.01-x86_64.AppImage
    wget https://files.openscad.org/${OPENSCAD_APPIMAGE}
    chmod a+x ${OPENSCAD_APPIMAGE}
    ./${OPENSCAD_APPIMAGE} --appimage-extract
    rm ./${OPENSCAD_APPIMAGE}
fi

${OPENSCAD_EXECUTABLE} --export-format stl -o output.stl ${SCAD_FILE}

echo 'converting done!!!'
