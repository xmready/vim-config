# Vim Config

## Table of Contents

- [Requirements](#requirements)
- [Usage](#usage)
    - [Import Signing Key](#import-signing-key)
    - [Desktop Setup](#desktop-setup)
    - [Server Setup](#server-setup)
- [Setup Features](#setup-features)
    - [Desktop Setup Features](#desktop-setup-features)
    - [Server Setup Features](#server-setup-features)

## Requirements

- Debian or Debian based operating system
- Access to terminal/shell where output is visible
- Terminal/shell user has sudo privileges
- `bash` & `curl` must be installed already
- `gpg` recommended for signature verification
- Working internet connection

## Usage

### Import Signing Key

Add [xmready's PGP signing key](https://keys.openpgp.org/vks/v1/by-fingerprint/31310B484B30ADABE8527D0E17AF13F5D2F5013A) to your keyring
```
gpg --keyserver "hkps://keys.openpgp.org" --recv-keys 17AF13F5D2F5013A
```

### Desktop Setup

1. Change working directory to `/tmp`
```
cd /tmp
```
2. Download `setup-desktop-vim.sh` with the checksums & signature from the [latest release](https://github.com/xmready/vim-config/releases)
```
curl \
    --fail \
    --location \
    --output-dir "$PWD" \
    --remote-name \
    "https://github.com/xmready/vim-config/releases/latest/download/{setup-desktop-vim.sh,SHA256SUMS,SHA256SUMS.sign}"
```
3. Verify the PGP signature
```
gpg --verify "SHA256SUMS.sign" "SHA256SUMS"
```
4. Make `setup-desktop-vim.sh` executable
```
chmod +x "setup-desktop-vim.sh"
```
5. Verify the checksum of `setup-desktop-vim.sh` against `SHA256SUMS`
```
sha256sum --ignore-missing -c "SHA256SUMS"
```
6. Run the setup script
```
./setup-desktop-vim.sh
```

### Server Setup

1. Change working directory to `/tmp`
```
cd /tmp
```
2. Download `setup-server-vim.sh` with the checksums & signature from the [latest release](https://github.com/xmready/vim-config/releases)
```
curl \
    --fail \
    --location \
    --output-dir "$PWD" \
    --remote-name \
    "https://github.com/xmready/vim-config/releases/latest/download/{setup-server-vim.sh,SHA256SUMS,SHA256SUMS.sign}"
```
3. Verify the PGP signature
```
gpg --verify "SHA256SUMS.sign" "SHA256SUMS"
```
4. Make `setup-server-vim.sh` executable
```
chmod +x "setup-server-vim.sh"
```
5. Verify the checksum of `setup-server-vim.sh` against `SHA256SUMS`
```
sha256sum --ignore-missing -c "SHA256SUMS"
```
6. Run the setup script
```
./setup-server-vim.sh
```

## Setup Features

### Desktop Setup Features

- Install `vim-nox` & [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) dependencies
    - Install `ycmcompile` script in `/usr/local/bin/`
    - Clone [vim-config repository](https://github.com/xmready/vim-config) to `~/.vim`
    - Create symlink in `~` to custom `.vimrc`
    - Install custom `.vimrc` for root user
    - Install the following Nerd Fonts for current user
        - DejaVuSansMono
        - FiraCode
        - Hack
        - JetBrainsMono

### Server Setup Features

- Install custom `.vimrc` for current user
- Install custom `.vimrc` for root user
