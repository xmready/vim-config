#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/vim-config
#
# Purpose:
#   A script to install vim and configure it with vim-config.
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/vim-config/main/setup-desktop-vim.sh | bash -

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep tag_name |
  sed -E 's/.*"([^"]+)".*/\1/'
}

ycm_compile=https://raw.githubusercontent.com/xmready/vim-config/main/ycm-compile.sh
github_url=https://github.com/xmready/vim-config.git
vimrc_root_url=https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root
plug_url=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nerd_latest="$(get_latest_release ryanoasis/nerd-fonts)"
deja_url=https://github.com/ryanoasis/nerd-fonts/releases/download/"$nerd_latest"/DejaVuSansMono.tar.xz
fira_url=https://github.com/ryanoasis/nerd-fonts/releases/download/"$nerd_latest"/FiraCode.tar.xz
hack_url=https://github.com/ryanoasis/nerd-fonts/releases/download/"$nerd_latest"/Hack.tar.xz
jet_url=https://github.com/ryanoasis/nerd-fonts/releases/download/"$nerd_latest"/JetBrainsMono.tar.xz
fonts_path=~/.local/share/fonts

echo -e "\n$(tput setaf 3)installing vim\n$(tput sgr0)" \
&& sudo apt-get update \
&& sudo apt-get install -y \
  build-essential \
  cmake \
  curl \
  golang \
  mono-complete \
  openjdk-21-jdk \
  openjdk-21-jre \
  python3-dev \
  vim-nox \
&& echo -e "\n$(tput setaf 2)vim installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)install ycmcompile script\n$(tput sgr0)" \
&& sudo curl -fLo /usr/local/bin/ycm-compile "$ycm_compile" \
&& sudo chmod +x /usr/local/bin/ycm-compile \
&& echo -e "\n$(tput setaf 2)ycmcompile installed\n$(tput sgr0)" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 3)configuring vim\n$(tput sgr0)" \
&& git clone "$github_url" ~/.vim/ \
&& ln -s ~/.vim/.vimrc ~/.vimrc \
&& sudo curl -fLo /root/.vimrc "$vimrc_root_url" \
&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs "$plug_url" \
&& mkdir -p ~/.local/share/fonts \
&& curl -fL "$deja_url" | tar -xJ -C "$fonts_path" \
&& curl -fL "$fira_url" | tar -xJ -C "$fonts_path" \
&& curl -fL "$hack_url" | tar -xJ -C "$fonts_path" \
&& curl -fL "$jet_url" | tar -xJ -C "$fonts_path" \
&& fc-cache -vf "$fonts_path" \
&& echo -e "\n$(tput setaf 2)vim configured\n$(tput sgr0)"
