#!/bin/bash

alias aptInst="sudo apt install -y"

check_or_install_git () {
    if ! command -v git >/dev/null;
    then
        echo "Can't find git, start install git..."
        aptInst git
        git config --global user.email "billy4195.su@gmail.com"
        git config --global user.name "Billy Su"
        git config --global alias.st "status"
        git config --global alias.ci "commit"
        git config --global alias.br "branch"
        git config --global alias.co "checkout"
        git config --global core.editor "nvim"
    else
        echo "Git already installed."
    fi
}

check_or_create_repo_dir () {
    if [ ! -d ~/repo ];
    then
        mkdir ~/repo
    fi 
}

check_or_set_nvim_alias () {
    if [ $(grep -e "alias vim=[\'\"]nvim[\'\"]" -e "alias vi=[\'\"]nvim[\'\"]" ~/.bashrc | wc -l) -eq 2 ];
    then
        echo "nvim is setup in .bashrc"
    else
        echo "nvim alias is not found"
        echo "alias vim='nvim'" >> ~/.bashrc
        echo "alias vi='nvim'" >> ~/.bashrc
    fi
}

check_or_install_neovim () {
    if ! command -v nvim >/dev/null;
    then 
        echo "Can't find neovim, start install neovim..."
        cd ~/repo
        git clone https://github.com/neovim/neovim.git
        cd neovim
        aptInst ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
        make CMAKE_BUILD_TYPE=Release
        sudo make install
    else
        echo "Neovim already installed."
    fi
    check_or_set_nvim_alias
}

check_or_install_tmux () {
    if ! command -v tmux >/dev/null;
    then
        echo "Can't find tmux, start install tmux..."
        aptInst tmux
    else
        echo "tmux already installed."
    fi 
}

check_or_install_git
check_or_create_repo_dir
check_or_install_neovim
check_or_install_tmux

#cp .tmux.conf ~/
#cp .vimrc ~/
#cp -r .vim ~/
