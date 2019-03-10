#!/bin/bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White'



# The List of vim plugins to install
declare -A plugins=(
    ["vim-surround"]="https://github.com/tpope/vim-surround.git"
    ["multiple-cursors"]="https://github.com/terryma/vim-multiple-cursors.git"
    ["eunuch"]="https://github.com/tpope/vim-eunuch.git"
    ["EditorConfig"]="https://github.com/editorconfig/editorconfig-vim.git"
    ["supertab"]="https://github.com/ervandew/supertab.git"
    ["undutree"]="https://github.com/mbbill/undotree.git"
    ["tagbar"]="https://github.com/majutsushi/tagbar.git"
    ["nerdtree"]="https://github.com/scrooloose/nerdtree.git"
    ["nerdcommenter"]="https://github.com/scrooloose/nerdcommenter.git"
    ["syntastic"]="https://github.com/scrooloose/syntastic.git"
    ["vim-repeat"]="https://github.com/tpope/vim-repeat.git"
    ["tabular"]="git://github.com/godlygeek/tabular.git"
    ["endwise"]="git://github.com/tpope/vim-endwise.git"
    ["airline"]="https://github.com/bling/vim-airline.git"
    ["Bbye"]="https://github.com/moll/vim-bbye.git"
    ["Ack"]="https://github.com/mileszs/ack.vim.git"
    ["CtrlP"]="https://github.com/kien/ctrlp.vim.git"
    ["delimitMate"]="https://github.com/Raimondi/delimitMate.git"
    ["YCM-Generato"]="https://github.com/rdnetto/YCM-Generator.git"
    ["fugitive"]="git://github.com/tpope/vim-fugitive.git"
    ["Misc"]="https://github.com/xolox/vim-misc"
    ["Easy-Tags"]="https://github.com/xolox/vim-easytags"
    ["Ale"]="https://github.com/w0rp/ale.git"
    ["GrouvyBox"]="https://github.com/morhetz/gruvbox/"
    ["YCM"]="https://github.com/Valloric/YouCompleteMe.git"
)

# Before anything let's install oracle java 10, what a pain...
echo -e "${Green}:::::::::::::Installing Java::::::::::::::${Color_Off}"
sudo add-apt-repository ppa:linuxuprising/java
sudo apt-get update
sudo apt-get install oracle-java10-installer

# The list of dependecies to install
dependecies=(
    "git"
    "neovim"
    "curl"
    "ack-grep"
    "build-essential cmake"
    "python-dev"
    "exuberant-ctags"
    "python-dev"
    "python-pip"
    "python3-dev"
    "python3-pip"
)

cp .vimrc ~/


# for now I'll keep the vim and the neovim when avaliable

echo -e "${Green}:::::::::::::Creating the symlinks to NeoVim::::::::::::::${Color_Off}"
mkdir -p ~/.config/nvim
ln -s ~/.config/nvim ~/.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc


echo -e "${Green}::::::::::::::::::Installing Dependecies::::::::::::::::::${Color_Off}"

for dep in "${dependecies[@]}";
do
    echo -e "${Blue}Installing --> $dep ${Color_Off}"
    sudo apt-get -y install $dep;
done

echo -e "${Green}:::::::::::::::::::Installing Phatogen:::::::::::::::::::${Color_Off}"

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle


echo -e "${Green}::::::::::::::::::Installing Vim Plugins::::::::::::::::::${Color_Off}"

for plug in "${!plugins[@]}";
do 
    echo -e "${Blue}Installing --> $plug ${Color_Off}"
    git clone ${plugins["$plug"]}; 
done


echo -e "${Green}::::::::::::::::::Installing Custom fonts:::::::::::::::::${Color_Off}"

mkdir -p ~/.vim/custom_fonts/
cd ~/.vim/custom_fonts/
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

echo -e "${Green}::::::::::::::::Installing YCM dependecies:::::::::::::::::${Color_Off}"

echo -e "${Purple}Completing installition for YCM  ${Color_Off}"
cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive

echo -e "${Blue}Installing --> clang  ${Color_Off}"
cd ~
mkdir clang
cd clang
wget http://releases.llvm.org/7.0.1/clang%2bllvm-7.0.1-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar -xvf clang%2bllvm-7.0.1-x86_64-linux-gnu-ubuntu-18.04.tar.xz
mv clang%2bllvm-7.0.1-x86_64-linux-gnu-ubuntu-18.04 clang_root_dir

cd ~
mkdir ycm_build
cd ycm_build


echo -e "${Blue}Installing --> YCM  ${Color_Off}"
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/clang/clang_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release

echo "export PATH=$HOME/clang/clang_root_dir/bin/:\$PATH" >> ~/.bashrc
echo "~/.vim/bundle/gruvbox/gruvbox_256palette.sh" >> ~/.bashrc

source ~/.bashrc

vim -u NONE -c "helptags vim-fugitive/doc" -c q

