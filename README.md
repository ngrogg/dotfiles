# dotfiles

## Overview
Dot files are configuration files used as part of configuring my Linux install.
These include files like my rc files and any other configurations I might have as well.

## Files
Included are the following files: <br>
* **Microsoft.PowerShell_profile.ps1**, PowerShell rc file. Goes in `~/.config/powershell/Microsoft.PowerShell_profile.ps1` on Linux.
* **.pylintrc**, pylint rc file. Goes in `~/.pylintrc`.
* **templates**, Vim template files. Goes in `~/.vim/templates` and is configured as part of my .vimrc below.
* **.tmux.conf**, Tmux configuration file. Goes in `~/.tmux.conf`.
* **.vimrc**, Vim configuration file. Goes in `~/.vimrc`. To use as is requires the following packages (on DEB based systems):
	* ALE
		- Pylint
		- Rustfmt
	* YouCompleteMe
	 	- build-essential cmake3 python3-dev
		- Install YouCompleteMe with clangd and rust support: `cd ~/.vim/plugged/YouCompleteMe; python3 install.py --clangd-completer --rust-completer`
* **.zshrc**, ZSH configuration file. Goes in `~/.zshrc`.
