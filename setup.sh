#!/bin/bash

aptInst="sudo apt install -y"
srcDir=$(dirname "$0")

check_or_install_git () {
    if ! command -v git >/dev/null;
    then
        echo "Can't find git, start install git..."
        $aptInst git
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
    if [ ! -d $HOME/repo ];
    then
        mkdir $HOME/repo
    fi 
}

check_or_set_nvim_alias () {
    if [ $(grep -e "alias vim=[\'\"]nvim[\'\"]" -e "alias vi=[\'\"]nvim[\'\"]" $HOME/.bashrc | wc -l) -eq 2 ];
    then
        echo "nvim is setup in .bashrc"
    else
        echo "nvim alias is not found"
        echo "# Nvim setting" >> $HOME/.bashrc
        echo "alias vim='nvim'" >> $HOME/.bashrc
        echo "alias vi='nvim'" >> $HOME/.bashrc
    fi
}

check_or_install_nvim_config () {
    nvimConfigDir="$HOME/.config/nvim"
    nvimConfigFile="$nvimConfigDir/init.vim"
    if ! command -v curl >/dev/null;
    then
        $aptInst curl
    fi
    if [ ! -f $HOME/.local/share/nvim/site/autoload/plug.vim ];
    then
        echo "Can't find vim-plug"
        echo "Install vim-plug..."
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi
    if [ ! -d $HOME/.config/nvim ];
    then
        echo "Nvim config folder doesn't exist."
        echo "Create nvim config folder"
        mkdir -p $HOME/.config/nvim
    else
        echo "Found nvim config folder"
    fi

    if [ ! -f $nvimConfigFile ];
    then
        echo "Nvim init.vim not found"
        echo "Copy init.vim..."
        echo "cp $srcDir/init.vim $nvimConfigFile"
        cp "$srcDir/init.vim" "$nvimConfigFile"

        echo "Installl plugins"
        nvim --headless +PlugInstall +qall
    else
        echo "Nvim init.vim found"
    fi
}

check_or_install_neovim () {
    if ! command -v nvim >/dev/null;
    then 
        echo "Can't find neovim, start install neovim..."
        cd $HOME/repo
        git clone https://github.com/neovim/neovim.git
        cd neovim
        $aptInst ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
        make CMAKE_BUILD_TYPE=Release
        sudo make install
    else
        echo "Neovim already installed."
    fi
    check_or_set_nvim_alias
    check_or_install_nvim_config
}

check_or_install_tmux_config () {
    tmuxConfigFile="$HOME/.tmux.conf"
    if [ ! -f $tmuxConfigFile ];
    then
        echo "Tmux .tmux.conf not found"
        echo "Copy .tmux.conf..."
        echo "cp $srcDir/.tmux.conf $tmuxConfigFile"
        cp "$srcDir/.tmux.conf" "$tmuxConfigFile"

    else
        echo "Tmux configuration file is found"
    fi
}

check_or_install_tmux () {
    if ! command -v tmux >/dev/null;
    then
        echo "Can't find tmux, start install tmux..."
        $aptInst tmux
    else
        echo "tmux already installed."
    fi 
    check_or_install_tmux_config
}

check_or_install_git
check_or_create_repo_dir
check_or_install_neovim
check_or_install_tmux

#cp .tmux.conf $HOME/
#cp .vimrc $HOME/
#cp -r .vim $HOME/
