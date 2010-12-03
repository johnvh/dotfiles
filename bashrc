#!/bin/bash

# append to history on exit
shopt -s histappend				

PATH=~/bin:$PATH
export PATH
export EDITOR=vim
export HISTFILE=~/.bash_history

# erase duplicate commands
export HISTCONTROL=erasedups	
# save lots of history
export HISTSIZE=10000			
# xmllint --format indent char
export XMLLINT_INDENT='	'
# always grep w/ color
export GREP_OPTIONS='--color=auto'

source ~/bin/setprompt

alias ls='ls -alG'
alias cal='cal | grep -C6 --color -e " $(date +%e)" -e "^(date +%e)"';
alias s='svn stat --ignore-externals .'

if [ -f ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi
