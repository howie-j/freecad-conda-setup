#!/usr/bin/env bash

# exit script if an error occurs
set -e

# activate conda
. $HOME/miniforge3/etc/profile.d/conda.sh

# cleanup
conda init --reverse
CONDA_BASE_ENVIRONMENT=$(conda info --base)
rm -rf ${CONDA_BASE_ENVIRONMENT}
rm -f "${HOME}/.condarc"
rm -fr ${HOME}/.conda

echo "Conda (miniforge) uninstalled successfully"