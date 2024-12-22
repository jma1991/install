#
# Installs the latest SRA tools
#
set -ue

# SRA version number.
SRA_VER=3.0.0

# Select the download based on the platform.
if [ "$(uname)" == "Darwin" ]; then
  SRA_NAME=sratoolkit.${SRA_VER}-mac64
else
  SRA_NAME=sratoolkit.${SRA_VER}-ubuntu64
fi

# The SRA tar library archhive.
SRA_TAR=${SRA_NAME}.tar.gz

# The SRA urls.
SRA_URL=https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${SRA_VER}/${SRA_TAR}

# The location of the binaries
BIN=~/bin

# Create the bin directory
mkdir -p ${BIN}

# Download the library
(cd ${BIN} && (curl -s ${SRA_URL} > ${SRA_TAR}))

# Unpack the software.
(cd ${BIN} && tar zxf ${SRA_TAR})

# The bash profile
PROFILE=~/.biostar.sh

# Alter the PATH if necessary.
grep -qF ${SRA_NAME} ${PROFILE} || printf "# sratools install path\nexport PATH=~/bin/${SRA_NAME}/bin:\$PATH\n\n" >> ${PROFILE}

# Fix the check on vdbconfig.
DIR=~/.ncbi
mkdir -p  ${DIR}
printf '/LIBS/GUID = "%s"\n' `uuidgen` > ${DIR}/user-settings.mkfg
