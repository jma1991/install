#
# Excelra Handbook system bootstrap.
#

# Check that the script runs using bash
if [ -z "$BASH_VERSION" ]; then
  echo "#"
  echo "# Error:  this script must be run using the bash shell!"
  echo "#"
  exit 1
fi

# Check that bzip2 is present.
if ! command -v bzip2 &> /dev/null
then
    echo "#"
    echo "# Error: bzip2 command not found"
    echo "#"
    exit 1
fi

# Bash strict mode.
set -ue

echo "#"
echo "# 1. Bootstrapping the Excelra Handbook (10 steps)"
echo "#"

# Bioinformatics tool environment name.
ENV_BIOINFO=bioinfo

# Statistics environment name.
ENV_STATS=stats

# Conda root prefix.
ROOT=~/micromamba

# Make the bin directory.
mkdir -p ~/bin

echo "# 2. Installing micromamba"
echo "#"

# Select the download based on the platform.
if [ "$(uname)" == "Darwin" ]; then
	URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
	curl -Lks https://micro.mamba.pm/api/micromamba/osx-64/latest | tar -xj ~/bin/micromamba
else
	URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
	curl -Lks https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xj ~/bin/micromamba
fi

echo "# 3. Configuring micromamba channels"
echo "#"
# Append the channels.
~/bin/micromamba config prepend channels conda-forge
~/bin/micromamba config append channels bioconda

# Set strict channel priority.
~/bin/micromamba config set channel_priority strict

echo "# 4. Configuring the shell"
echo "#"

# Initialize the shell
~/bin/micromamba shell init -s bash -p ${ROOT} -q

# Download the environment setup file.
cat excelra.sh > ~/.excelra.sh

# Ensure that the .bashrc file exists.
touch ~/.bashrc

# Append to bashrc if necessary.
if ! grep -q ".excelra.sh" ~/.bashrc; then
  echo "" >> ~/.bashrc
  echo "source ~/.excelra.sh" >> ~/.bashrc
  echo "" >> ~/.bashrc
fi

# Ensure that the .bash_profile file exists.
touch ~/.bash_profile

# Append to .bash_profile if necessary.
if ! grep -q ".bashrc" ~/.bash_profile; then
  echo "" >> ~/.bash_profile
  echo "source ~/.bashrc" >> ~/.bash_profile
  echo "" >> ~/.bash_profile
fi

# Check that the conda environment exists
if [ ! -d "$ROOT/envs/$ENV_BIOINFO" ]; then
  echo "# 5. Creating the ${ENV_BIOINFO} environment"
  echo "#"
  ~/bin/micromamba create -q -r ${ROOT} -n $ENV_BIOINFO -y python=3.8
fi

# Install the software for the excelra handbook.
echo "# 6. Installing tools into ${ENV_BIOINFO}"
echo "#"
cat conda.txt | xargs ~/bin/micromamba install -r ${ROOT} -n ${ENV_BIOINFO} -y -q

# Install the doctor
echo "# 7. Installing doctor.py"
echo "#"

# Install the doctor.py 
mkdir -p ~/bin
cat doctor.py > ~/bin/doctor.py
chmod +x ~/bin/doctor.py

# Install the bio package.
echo "# 8. Installing the bio package"
echo "#"
${ROOT}/envs/${ENV_BIOINFO}/bin/python -m pip install bio -q --upgrade

# Install the Entrez toolkit
echo "# 9. Installing Entrez Direct"
echo "#"
yes no | sh -c "$(curl -fsSL ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)" > /dev/null

echo "# 10. Installing the SRA toolkit"
echo "#"
cat sratools.sh | bash

# Turn on strict error checking.
set -eu

# There is a "nagware" aspect to GNU parallel that interferes running it automatically.
# The commands below silences the warning messages.
(mkdir -p ~/.parallel && touch ~/.parallel/will-cite)

# Installation completed.
echo "# The Excelra Handbook software installation complete!"
echo "#"
echo "# Restart the terminal or type: source ~/.bash_profile"
echo "#"
