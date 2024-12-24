#
# Biostar Handbook system bootstrap.
#

# Check that the script runs using bash
if [ -z "$BASH_VERSION" ]; then
  echo "#"
  echo "# Error:  this script must be run using the bash shell!"
  echo "#"
  exit 1
fi

# Bash strict mode.
set -ue

echo "#"
echo "# Biostar Handbook: statistics package installation"
echo "#"


# Statistics environment name.
ENV_STATS=stats

# Conda root prefix.
ROOT=~/micromamba

# Check that the conda environment exists
if [ ! -d "$ROOT/envs/$ENV_STATS" ]; then
  echo "# Creating the ${ENV_STATS} environment"
  echo "#"
  ~/bin/micromamba create -y -q -r ${ROOT} -n $ENV_STATS
fi

# Install the software for the biostar handbook.
echo "# Installing packages into ${ENV_STATS}"
echo "#"
curl -s https://raw.githubusercontent.com/jma1991/install/refs/heads/main/excelra/stats.txt | xargs ~/bin/micromamba install -r ${ROOT} -n ${ENV_STATS} -y -q

# Installation completed.
echo "#"
echo "#"
echo "#"
echo "# The Biostar Handbook statistical software installation complete!"
echo "#"
echo "#"
echo "#"
echo "# conda activate ${ENV_STATS}"
echo "#"
