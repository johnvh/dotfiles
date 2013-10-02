#!/bin/bash

# append to history on exit
shopt -s histappend				

PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
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
setprompt

alias ls='ls -alG'
alias cal='cal | grep -C6 --color -e " $(date +%e)" -e "^(date +%e)"';
alias s='svn stat --ignore-externals .'

if [ -f ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi

if which brew > /dev/null 2>&1; then
  if brew list | grep -q git; then
    source $(brew --prefix git)/etc/bash_completion.d/git-completion.bash
  fi
fi

# path functions...
# append, prepend, remove stolen from:
# http://stackoverflow.com/questions/370047/what-is-the-most-elegant-way-to-remove-a-path-from-the-path-variable-in-bash

# print $PATH
path () { echo $PATH; }

path_append () { 
    path_remove "$1"
    export PATH="$PATH:$1"
}

path_prepend () { 
    path_remove "$1"
    export PATH="$1:$PATH"
}

path_remove () {
    export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`
}

# removes 1st part from path
path_shift () {
    export PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: 'FNR>1' | sed 's/:$//')
}

# prepends $PWD/node_modules/.bin on $PATH
path_node_modules () { path_prepend "$PWD/node_modules/.bin"; }

