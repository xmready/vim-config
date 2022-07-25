#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/vim-config
#
# Purpose:
#   A script to install vim and configure it with vim-config.
#
# Non-root usage:
#   curl -fsSL https://raw.githubusercontent.com/xmready/vim-config/main/vim-config.sh | bash -

# add nodesource repository
KEYRING=/usr/share/keyrings/nodesource.gpg \
VERSION=node_16.x \
DISTRO="$(lsb_release -s -c)" \
echo -e "\n$(tput setaf 3)adding NodeSource repository\n$(tput sgr0)" \
wget --quiet -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | sudo tee "$KEYRING" >/dev/null \
echo "deb [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list \
echo "deb-src [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list \
echo -e "\n$(tput setaf 2)NodeSource added\n$(tput sgr0)" \
&& sleep 3 \

# install vim-nox and dependencies
echo -e "\n$(tput setaf 3)installing Vim and dependencies\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install curl vim-nox build-essential cmake python3-dev mono-complete golang nodejs default-jdk \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)" \
&& sleep 3 \

# add vimrc
&& echo -e "\n$(tput setaf 3)adding vimrc, vim-plug, templates\n$(tput sgr0)" \
&& mkdir -p ~/.vim/swap \
&& curl -fLo ~/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc \
&& sudo curl -fLo /root/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root \

# add vim-plug
&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \

# add skeleton files
&& curl -fLo ~/.vim/templates/skeleton.html --create-dirs https://raw.githubusercontent.com/xmready/vim-config/main/.vim/templates/skeleton.html \

# add ycmcompile.sh
&& sudo curl -fLo /usr/local/bin/ycmcompile https://raw.githubusercontent.com/xmready/vim-config/main/ycmcompile.sh \
&& sudo chmod +x /usr/local/bin/ycmcompile \
&& echo -e "\n$(tput setaf 2)vimrc, vim-plug, templates added\n$(tput sgr0)"
