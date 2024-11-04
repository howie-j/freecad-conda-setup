# FreeCAD Conda Setup

Conda development setup for FreeCAD on Linux.

A simple setup script for installing conda (miniforge), cloning FreeCAD source, compiling, and finally running FreeCAD. This script is based on the [FreeCAD Developers Handbook](https://freecad.github.io/DevelopersHandbook/gettingstarted/) and the [official miniforge instructions.](https://github.com/conda-forge/miniforge/)

## Instructions

- [Optional] Change the paths and URL in [setup.sh](setup.sh) to your preference
- Run `bash setup.sh`

Tested on:

- `Ubuntu 22.04`
- `Ubuntu 24.04`
- `Fedora 40`
- `Fedora 41`

Warning: git needed on ubuntu, install with `sudo apt install -y git`

## Uninstall Conda

To uninstall conda (miniforge), run `uninstall.sh`
