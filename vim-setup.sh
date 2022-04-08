#!/usr/bin/bash

echo -e "\n$(tput setaf 3)installing vim and dependencies\n$(tput sgr0)" \
&& sudo apt update \
&& sudo apt install wget curl vim-nox build-essential cmake python3-dev mono-complete golang nodejs default-jdk npm \
&& echo -e "\n$(tput setaf 2)packages installed\n$(tput sgr0)" \
&& sleep 3 \

&& echo -e "\n$(tput setaf 3)adding vimrc, vim-plug, templates\n$(tput sgr0)" \
&& curl -fLo ~/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc \
&& sudo curl -fLo /root/.vimrc https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root \
&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
&& curl -fLo ~/.vim/templates/skeleton.html --create-dirs https://raw.githubusercontent.com/xmready/vim-config/main/.vim/templates/skeleton.html \
&& mkdir ~/.vim/swap \
&& echo -e "\n$(tput setaf 2)vimrc, vim-plug, templates added\n$(tput sgr0)"
