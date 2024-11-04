#!/usr/bin/env bash

# paths - change these to your preference
FREECAD_SOURCE_DIR="$HOME/git/freecad-source"
FREECAD_BUILD_DIR="$HOME/git/freecad-build"

set -e

# install miniforge
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-Linux-x86_64.sh -b
rm Miniforge3-Linux-x86_64.sh

# activate miniforge
. $HOME/miniforge3/etc/profile.d/conda.sh
conda activate

# get freecad source
git clone --recurse-submodules https://github.com/FreeCAD/FreeCAD.git "$FREECAD_SOURCE_DIR"
cd "$FREECAD_SOURCE_DIR"

# setup conda
./conda/setup-environment.sh
conda activate freecad

# compile
cmake -B "$FREECAD_BUILD_DIR" --preset conda-linux-debug .
cmake --build "$FREECAD_BUILD_DIR" --parallel

# run freecad
"$FREECAD_BUILD_DIR/bin/FreeCAD"