# dotfiles

## Overview
Dot files are configuration files used as part of configuring my Linux install.
These include files like my rc files and any other configurations I might have as well.

## Files
Included are the following files: <br>
* **bin**, bin folder for `~/bin`.
  - **passgen**, BASH script to generate passwords
  - **colors**, BASH script list colors in console. Useful for vimrc configs and the like.
* **colors**, colors folder for `~/.vim`. Used for custom vim themes. Has habamax theme for older Vim 8 install as theme is from Vim 9.
* **Microsoft.PowerShell_profile.ps1**, PowerShell rc file. Goes in `~/.config/powershell/Microsoft.PowerShell_profile.ps1` on Linux.
* **.pylintrc**, pylint rc file. Goes in `~/.pylintrc`.
* **settings.json**, VSCode settings.json file. Goes in `~/.config/Code/User/settings.json`.
* **templates**, Vim template files. Goes in `~/.vim/templates` and is configured as part of my .vimrc below.
* **.tmux.conf**, Tmux configuration file. Goes in `~/.tmux.conf`.
* **.vimrc**, Vim configuration file. Goes in `~/.vimrc`. To use as is requires the following packages (on DEB based systems):
	* ALE
		- pylint
	* YouCompleteMe
	 	- build-essential cmake3 python3-dev
		- Install YouCompleteMe with clangd support: `cd ~/.vim/plugged/YouCompleteMe; python3 install.py --clangd-completer`
    Also requires the `colors` and `template` directories in the `~/.vim` directory. <br>
* **.vimrc.simple**, Vim configuration file. A simplified version that doesn't use plugins or additional files. Goes in `~/.vimrc`
* **zsaFiles**, Layout files and UDECV rule files for ZSA keyboards.
* **.zshrc**, ZSH configuration file. Goes in `~/.zshrc`. Requires that filepath `~/.zsh/cache' exists.
