#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/vim-config
#
# Purpose:
#   A script to install vim and configure it with vim-config.
#
# Non-root usage:
#   wget -O- https://raw.githubusercontent.com/xmready/vim-config/main/setup-vim.sh | bash -

NODE_PGP=https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key
NODE_KEYRING=/usr/share/keyrings/nodesource.gpg
NODE_URL=https://deb.nodesource.com

get_latest_release_major() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep tag_name |
  sed -E 's/.*v([[:digit:]]+).*/\1/'
}

NODE_LATEST="$(get_latest_release_major nodejs/node)"
NODE_SOURCES=/etc/apt/sources.list.d/nodesource.list
YCM_COMPILE=https://raw.githubusercontent.com/xmready/vim-config/main/ycm-compile.sh
GIT_URL=https://github.com/xmready/vim-config.git
PLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep tag_name |
  sed -E 's/.*"([^"]+)".*/\1/'
}

NERD_LATEST="$(get_latest_release ryanoasis/nerd-fonts)"
DEJA_URL=https://github.com/ryanoasis/nerd-fonts/releases/download/"$NERD_LATEST"/DejaVuSansMono.tar.xz
FIRA_URL=https://github.com/ryanoasis/nerd-fonts/releases/download/"$NERD_LATEST"/FiraCode.tar.xz
HACK_URL=https://github.com/ryanoasis/nerd-fonts/releases/download/"$NERD_LATEST"/Hack.tar.xz
JET_URL=https://github.com/ryanoasis/nerd-fonts/releases/download/"$NERD_LATEST"/JetBrainsMono.tar.xz

echo -e "\n$(tput setaf 3)adding NodeSource repo\n$(tput sgr0)" \
&& curl -fL "$NODE_PGP" \
  | gpg --dearmor \
  | sudo tee "$NODE_KEYRING" > /dev/null \
&& echo "deb [signed-by=$NODE_KEYRING] $NODE_URL/node_$NODE_LATEST.x nodistro main" \
  | sudo tee "$NODE_SOURCES" \
&& echo -e "\n$(tput setaf 2)NodeSource repo added\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)installing Vim\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y \
  curl build-essential cmake golang mono-complete nodejs \
  openjdk-17-jdk openjdk-17-jre python3-dev vim-nox \
&& echo -e "\n$(tput setaf 2)Vim installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)install ycmcompile script\n$(tput sgr0)" \
&& sudo curl -fLo /usr/local/bin/ycm-compile "$YCM_COMPILE" \
&& sudo chmod +x /usr/local/bin/ycm-compile \
&& echo -e "\n$(tput setaf 2)ycmcompile installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)configuring Vim\n$(tput sgr0)" \
&& git clone "$GIT_URL" ~/.vim/ \
&& ln -s ~/.vim/.vimrc ~/.vimrc \
&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs "$PLUG_URL" \
&& mkdir -p ~/.local/share/fonts \
&& curl -fL "$DEJA_URL" | tar -xJ -C ~/.local/share/fonts \
&& curl -fL "$FIRA_URL" | tar -xJ -C ~/.local/share/fonts \
&& curl -fL "$HACK_URL" | tar -xJ -C ~/.local/share/fonts \
&& curl -fL "$JET_URL" | tar -xJ -C ~/.local/share/fonts \
&& fc-cache -vf ~/.local/share/fonts/ \
&& echo -e "\n$(tput setaf 2)Vim configured\n$(tput sgr0)"
