#!/bin/bash

# append to history on exit
shopt -s histappend

PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
export PATH
export EDITOR=vim
export HISTFILE=~/.bash_history

# dont history dupes, or command that start with space
export HISTCONTROL=erasedups:ignorespace
# save lots of history
export HISTSIZE=10000
# xmllint --format indent char
export XMLLINT_INDENT='	'
# always grep w/ color
export GREP_OPTIONS='--color=auto'

# fzf runs this by default, assumes ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/*'"

source ~/bin/setprompt
setprompt

alias ls='ls -alG'
alias ll='ls -alG'
alias cal='cal | grep -C6 --color -e " $(date +%e)" -e "^(date +%e)"';
alias s='svn stat --ignore-externals .'

if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

if [ -f $(brew --prefix 2> /dev/null)/etc/bash_completion ]; then
  . $(brew --prefix 2> /dev/null)/etc/bash_completion
fi


[[ ! -d ~/.config ]] && mkdir ~/.config

#######################
# base16 stuff
#######################

[[ ! -d ~/.config/base16-shell ]] && git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
BASE16_SHELL=$HOME/.config/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

_base16_current () {
  echo "base16-${BASE16_THEME#base16-}"
}

_base16_list () {
  local prefer=${BASE16_PREFER-all}
  local all=$(\ls -1 ${BASE16_SHELL}/scripts/ | sed 's/.sh$//')
  case $prefer in
    all)
      echo "$all"
      ;;
    dark|light)
      echo "$all" | ruby -e '
        dark = ARGV.first == "dark"
        $stderr.puts "dark? #{dark}"
        puts $stdin.readlines
          .collect { |fn|
            fn.chomp!
            {
              name: fn,
              bg: File.readlines(ENV["HOME"] + "/.config/base16-shell/scripts/" + fn + ".sh")
                .find { |l| l =~ /^color_background/ }
                .match(/="([^"]+)"/)[1]
                .gsub("/", "")
                .to_i(16)
            }
          }
          .find_all { |bg:, **|
            is_dark = (0xFF_FF_FF - bg) > bg
            dark ? is_dark : !is_dark
          }
          .collect { |d| d[:name] }
      ' -- $prefer
      ;;
    *)
      echo "dont know BASE16_PREFER" "$BASE16_PREFER" >&2
      ;;
  esac
}

_base16_choose () {
  _base16_list | ruby -e '
    all = $stdin.readlines.collect &:chomp
    # BASE16_THEME from env initally prefixed with "base16-", but not after switching
    current = "base16-" + ENV["BASE16_THEME"].sub(/^base16-/, "")
    next_n = ARGV.first.to_i
    next_idx = all.index(current) + next_n
    # $stderr.puts ARGV.inspect
    # $stderr.puts next_n
    puts all[next_idx % all.length].sub("-", "_")  # function is named base16_<color-theme>
  ' -- "$1"
}

_base16_next () {
  local theme=$(_base16_choose 1)
  echo $theme
  eval $theme
}

_base16_prev () {
  local theme=$(_base16_choose -1)
  echo $theme
  eval $theme
}

_base16_random () {
  local theme=$(_base16_list | ruby -e '
    all = $stdin.readlines
    puts all.sample.chomp.sub("-", "_")
  ')
  echo $theme
  eval $theme
}

_base16_select () {
  # TODO: change themes on fzf move? `fzf ... --preview='bash -lc "eval {}"'` is pretty close
  local theme=$(_base16_list \
    | ruby -e '
        current = "base16-" + ENV["BASE16_THEME"].sub(/^base16-/, "")
        all = $stdin.readlines.collect(&:chomp) - [current]
        puts [current].concat(all).collect { |t| t.sub "base16-", "base16_" }
      ' \
    | fzf --cycle --height=10
  )
  echo $theme
  eval $theme
}

#######################
# /base16 stuff
#######################

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

