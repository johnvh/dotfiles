# Johnvh's dotfiles

Dotfiles, scripts, etc.

Credit to [ryanb](https://github.com/ryanb/dotfiles) for RakeFile and
structure.

## Installation

Download repo:

	git clone git://github.com/johnvh/dotfiles.git ~/.dotfiles
	cd ~/.dotfiles

Install symlinks all declared files. Dry run supported.

	#dry-run: any arg to install
	rake install['noo']
	#install
	rake install

Uninstall removes symlinks created by 'install', Dry run supported.

	#dry-run: any arg to clobber
	rake clobber['noop']
	#uninstall
	rake clobber
