#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/vim-config
#
# Purpose:
#   A script to install vim and configure it with vim-config.
#
# Non-root usage:
#   wget --quiet -O- https://raw.githubusercontent.com/xmready/vim-config/main/setup-vim.sh | bash -

YCMCOMPILE=https://raw.githubusercontent.com/xmready/vim-config/main/ycmcompile.sh
PGPURL=https://deb.nodesource.com/gpgkey/nodesource.gpg.key
KEYRING=/usr/share/keyrings/nodesource.gpg
REPOURL=https://deb.nodesource.com
VERSION=node_19.x
DISTRO="$(lsb_release -s -c)"
SOURCES=/etc/apt/sources.list.d/nodesource.list
GITURL=https://github.com/xmready/vim-config.git

echo -e "\n$(tput setaf 3)installing Vim\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y \
  curl build-essential cmake golang mono-complete \
  openjdk-17-jdk openjdk-17-jre python3-dev vim-nox \
&& echo -e "\n$(tput setaf 2)Vim installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)install ycmcompile script\n$(tput sgr0)" \
&& sudo curl -fLo /usr/local/bin/ycmcompile "$YCMCOMPILE" \
&& sudo chmod +x /usr/local/bin/ycmcompile \
&& echo -e "\n$(tput setaf 2)ycmcompile installed\n$(tput sgr0)" \
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
&& echo -e "\n$(tput setaf 3)installing nodejs\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y nodejs \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)nodejs installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)configuring vim\n$(tput sgr0)" \
&& mkdir -p ~/.var/git/vim-config \
&& git clone "$GITURL" ~/.var/git/vim-config/ \
&& ln -s ~/.var/git/vim-config/.vimrc ~/.vimrc \
&& ln -s ~/.var/git/vim-config/.vim/ ~/.vim \
&& echo -e "\n$(tput setaf 2)vim configured\n$(tput sgr0)"
