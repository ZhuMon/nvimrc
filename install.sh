#!/bin/bash

nvim_dir="$HOME/.config/nvim"

# Check OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Mac OS detected"
else
    echo "OS not supported"
    exit 1
fi

# Install luarocks
brew install luarocks

# Install neovim
brew install neovim

# Install this config
if [ -d "$nvim_dir" ]; then
    echo "nvim directory already exists"
    exit 1
fi

git clone git@github.com:ZhuMon/nvimrc.git "$nvim_dir"

# Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install lua-format in the background
luarocks install --server=https://luarocks.org/dev luaformatter &

# Install plugins by packer
nvim -c 'PackerInstall'

# Install Mason tools
nvim -c 'MasonToolsUpdate'


# Install the nerd font
curl -L -o /tmp/BitstreamVeraSansMono.zip --url "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/BitstreamVeraSansMono.zip"
unzip /tmp/BitstreamVeraSansMono.zip -d /tmp/BitstreamVeraSansMono
cp /tmp/BitstreamVeraSansMono/*.ttf ~/Library/Fonts/
