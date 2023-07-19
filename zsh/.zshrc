export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
export EDITOR=nvim

. ~/.ohmyzsh.zshrc

[[ ! -d ~/.config ]] && mkdir ~/.config

# xmllint --format indent char
export XMLLINT_INDENT='	'
# always grep w/ color
export GREP_OPTIONS='--color=auto'
# fzf runs this by default, assumes ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/*'"

export BAT_THEME=base16-256

# make Ctrl-d NOT kill the shell. because it is easy to hit Ctrl-d multiple
# times from a ruby repl, and accidentally exit your shell session
setopt ignore_eof

# source ~/bin/setprompt
# setprompt

alias ll='ls -alG'
alias dc='docker-compose'
alias k=kubectl
alias be='bundle exec'

. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit

if type brew &> /dev/null; then
  # FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  fpath=($(brew --prefix)/share/zsh-completions $fpath)
  # autoload -Uz compinit
  # compinit
fi


# PROMPT="🔥 %1/ > "
# RPROMPT="%?"
#
# PROMPT='%(?:%{%}🔥 :%{%}➜ ) %{%}%c%{%} $(git_prompt_info)'

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:git:*' formats "%b "

autoload -Uz compinit && compinit
autoload -Uz vcs_info
autoload -U colors && colors
autoload -U promptinit && promptinit

precmd() {
  vcs_info
}

setopt prompt_subst
PROMPT='🔥 %{$fg[green]%}%1d%{$reset_color%} %{$fg[blue]%}${vcs_info_msg_0_}%{$reset_color%}> '
# PROMPT="%(?:%{%}🔥 :%{%}➜ ) %{%}%c%{%} ${vcs_info_msg_0_}% > "


#######################
# base16 stuff
#######################

# https://github.com/tinted-theming/base16-shell
BASE16_SHELL_PATH="$HOME/.config/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"

# some custom functions for switching themes...

_base16_current () {
  echo "base16-${BASE16_THEME#base16-}"
}

_base16_list () {
  local prefer=${BASE16_PREFER-all}
  local all=$(\ls -1 ${BASE16_SHELL_PATH}/scripts/ | sed 's/.sh$//')
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
# /end base16 stuff
#######################

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
