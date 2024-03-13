# README

1. Update your Linux system.

```sh
sudo apt-get update && sudo apt-get upgrade -y
```

2. Install the required Linux libraries and Java.

```sh
sudo apt install -y bzip2
```

3. Change directory to install directory.

```sh
cd install/excelra
```

4. Run the installation script.

```sh
bash install.sh
```

5. Restart the terminal or source the ~/.bash_profile file.

```sh
source ~/.bash_profile
```

6. Run `doctor.py` to verify that the installation was succesful.

```sh
conda activate bioinfo && doctor.py && conda deactivate
```