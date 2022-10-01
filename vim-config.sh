#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/vim-config
#
# Purpose:
#   A script to install vim and configure it with vim-config.
#
# Non-root usage:
#   curl -fsSL https://raw.githubusercontent.com/xmready/vim-config/main/vim-config.sh | bash -

VIMRC=https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc
VIMRCROOT=https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root
PLUGVIM=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
SKELHTML=https://raw.githubusercontent.com/xmready/vim-config/main/.vim/templates/html/skeleton.html
YCMCOMPILE=https://raw.githubusercontent.com/xmready/vim-config/main/ycmcompile.sh
PGPURL=https://deb.nodesource.com/gpgkey/nodesource.gpg.key
KEYRING=/usr/share/keyrings/nodesource.gpg
REPOURL=https://deb.nodesource.com
VERSION=node_16.x
DISTRO="$(lsb_release -s -c)"
SOURCES=/etc/apt/sources.list.d/nodesource.list

echo -e "\n$(tput setaf 3)installing Vim\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y \
  curl build-essential cmake golang mono-complete \
  openjdk-17-jdk openjdk-17-jre python3-dev vim- nox \
&& echo -e "\n$(tput setaf 2)Vim installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)configuring Vim\n$(tput sgr0)" \
&& mkdir -p ~/.vim/swap \
&& mkdir -p ~/.vim/autoload \
&& mkdir -p ~/.vim/templates/html \
&& mkdir -p ~/.vim/templates/js \
&& mkdir -p ~/.vim/templates/ts \
&& curl -fLo ~/.vimrc "$VIMRC" \
&& sudo curl -fLo /root/.vimrc "$VIMRCROOT" \
&& curl -fLo ~/.vim/autoload/plug.vim "$PLUGVIM" \
&& curl -fLo ~/.vim/templates/html/skeleton.html "$SKELHTML" \
&& sudo curl -fLo /usr/local/bin/ycmcompile "$YCMCOMPILE" \
&& sudo chmod +x /usr/local/bin/ycmcompile \
&& echo -e "\n$(tput setaf 2)Vim configured\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)adding NodeSource repo\n$(tput sgr0)" \
&& curl -fL "$PGPURL" \
  | gpg --dearmor \
  | sudo tee "$KEYRING" > /dev/null \
&& echo "deb [signed-by=$KEYRING] $REPOURL/$VERSION $DISTRO main" \
  | sudo tee "$SOURCES" \
&& echo "deb-src [signed-by=$KEYRING] $REPOURL/$VERSION $DISTRO main" \
  | sudo tee -a "$SOURCES" \
&& echo -e "\n$(tput setaf 2)NodeSource repo added\n$(tput sgr0)" \
&& sleep 3 \
echo -e "\n$(tput setaf 3)installing nodejs\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y nodejs \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)nodejs installed\n$(tput sgr0)"
