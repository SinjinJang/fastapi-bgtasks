#!/bin/sh

SCAD_FILE=$1

OPENSCAD_APP=OpenSCAD-2021.01-x86_64.AppImage
if [ ! -f ${OPENSCAD_APP} ]; then
    wget https://files.openscad.org/${OPENSCAD_APP}
    chmod a+x ${OPENSCAD_APP}
    ln -sf ${OPENSCAD_APP} openscad
fi

./openscad --export-format stl -o output.stl ${SCAD_FILE}

echo 'converting done!!!'
