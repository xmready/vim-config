#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/vim-config
#
# Purpose:
#   A script to install vim and configure it with vim-config.
#
# Non-root usage:
#   curl -fsSL https://raw.githubusercontent.com/xmready/vim-config/main/vim-config.sh | bash -

# NodeSource repository configuration and installation
echo -e "\n$(tput setaf 3)adding NodeSource repo\n$(tput sgr0)" \
&& KEYRING=/usr/share/keyrings/nodesource.gpg \
&& VERSION=node_16.x \
&& DISTRO="$(lsb_release -s -c)" \
&& curl -fL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | sudo tee "$KEYRING" >/dev/null \
&& echo "deb [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list \
&& echo "deb-src [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list \
&& echo -e "\n$(tput setaf 2)NodeSource repo added\n$(tput sgr0)" \
&& sleep 3 \
echo -e "\n$(tput setaf 3)installing nodejs\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install -y nodejs \
&& echo -e "\n$(tput setaf 2)nodejs installed\n$(tput sgr0)" \
&& sleep 3 \

# install vim-nox and dependencies
&& echo -e "\n$(tput setaf 3)installing Vim and dependencies\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install curl build-essential cmake golang mono-complete openjdk-17-jdk openjdk-17-jre python3-dev vim-nox \
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
