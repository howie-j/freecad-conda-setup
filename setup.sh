#!/usr/bin/env bash

# git url
FREECAD_GIT_URL="https://github.com/FreeCAD/FreeCAD.git"

# git paths
FREECAD_SOURCE_DIR="$HOME/git/freecad"
FREECAD_BUILD_DIR="$HOME/git/freecad/build/debug"

# exit script if an error occurs
set -e

# install conda (miniforge)
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3.sh -b
rm Miniforge3.sh

# activate conda
. $HOME/miniforge3/etc/profile.d/conda.sh
conda activate

# get freecad source
git clone --recurse-submodules "$FREECAD_GIT_URL" "$FREECAD_SOURCE_DIR"
cd "$FREECAD_SOURCE_DIR"

# setup conda
./conda/setup-environment.sh
conda activate freecad

# compile
cmake -B "$FREECAD_BUILD_DIR" --preset conda-linux-debug .
cmake --build "$FREECAD_BUILD_DIR" --parallel

# run freecad
"$FREECAD_BUILD_DIR/bin/FreeCAD"