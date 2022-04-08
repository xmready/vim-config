#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/vim-config
#
# Purpose:
#   A script to create custom .vimrc for servers
#
# sudo usage:
#   curl -fL https://raw.githubusercontent.com/xmready/vim-config/main/setup-server-vim.sh | bash -

vimrc_root_url=https://raw.githubusercontent.com/xmready/vim-config/main/.vimrc-root

echo -e "\n$(tput setaf 3)configuring Vim\n$(tput sgr0)" \
&& sudo -v \
&& curl -fLo ~/.vimrc "$vimrc_root_url" \
&& sudo curl -fLo /root/.vimrc "$vimrc_root_url" \
&& sleep 3 \
&& echo -e "\n$(tput setaf 2)Vim configured\n$(tput sgr0)"
