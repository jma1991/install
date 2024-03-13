# Install Miniconda
mkdir -p ~/Miniconda3-latest-MacOSX-arm64
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/Miniconda3-latest-MacOSX-arm64/miniconda.sh
bash ~/Miniconda3-latest-MacOSX-arm64/miniconda.sh -b -u -p ~/Miniconda3-latest-MacOSX-arm64
rm -rf ~/Miniconda3-latest-MacOSX-arm64/miniconda.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/james/Miniconda3-latest-MacOSX-arm64/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/james/Miniconda3-latest-MacOSX-arm64/etc/profile.d/conda.sh" ]; then
        . "/Users/james/Miniconda3-latest-MacOSX-arm64/etc/profile.d/conda.sh"
    else
        export PATH="/Users/james/Miniconda3-latest-MacOSX-arm64/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<






mkdir -p ~/Miniconda3-latest-MacOSX-x86_64
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/Miniconda3-latest-MacOSX-x86_64/miniconda.sh
bash ~/Miniconda3-latest-MacOSX-x86_64/miniconda.sh -b -u -p ~/Miniconda3-latest-MacOSX-x86_64
rm -rf ~/Miniconda3-latest-MacOSX-x86_64/miniconda.sh
~/Miniconda3-latest-MacOSX-x86_64/bin/conda init zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/james/Miniconda3-latest-MacOSX-x86_64/bin/conda' 'shell.zsh' 'hook' 2> /d$
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/james/Miniconda3-latest-MacOSX-x86_64/etc/profile.d/conda.sh" ]; then
        . "/Users/james/Miniconda3-latest-MacOSX-x86_64/etc/profile.d/conda.sh"
    else
        export PATH="/Users/james/Miniconda3-latest-MacOSX-x86_64/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
