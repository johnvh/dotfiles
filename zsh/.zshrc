export PATH=~/bin:${PATH}
export EDITOR=nvim

DISABLE_AUTO_UPDATE=true
. ~/.ohmyzsh.zshrc

[[ ! -d ~/.config ]] && mkdir ~/.config

# xmllint --format indent char
export XMLLINT_INDENT='  '
# always grep w/ color
export GREP_OPTIONS='--color=auto'
# fzf runs this by default, assumes ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!.git/*'"

export BAT_THEME=base16-256

# make Ctrl-d NOT kill the shell. because it is easy to hit Ctrl-d multiple
# times from a ruby repl, and accidentally exit your shell session
setopt ignore_eof

# source ~/bin/setprompt
# setprompt

alias ll='ls -alG'
alias dc='docker compose'
alias k=kubectl
alias kcc='kubectx -c; kubens -c'
alias be='bundle exec'

if type brew &> /dev/null; then
  # FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  fpath=($(brew --prefix)/share/zsh-completions $fpath)
  # autoload -Uz compinit
  # compinit
fi

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# . "$HOME/.asdf/asdf.sh"
# append completions to fpath
# fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit


## 
## https://github.com/danielfoehrKn/kubeswitch
## 
# if [[ which -s switcher ]]; then
source <(switcher init zsh)
source <(compdef _switcher switch)
alias ks=switch


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
PROMPT='🔥 %{$fg[green]%}%1d%{$reset_color%} %{$fg[blue]%}${vcs_info_msg_0_}%{$reset_color%}→ '
# PROMPT="%(?:%{%}🔥 :%{%}➜ ) %{%}%c%{%} ${vcs_info_msg_0_}% > "
#
RPS1='%B%(?.%F{green}.%F{red})%?%f%b'


#######################
# color stuff
#######################

tinty apply $(cat ~/.local/share/tinted-theming/tinty/current_scheme)

TINTY_PREFER=dark

tinty_list_dark() {
  tinty list --json | jq '.[] | select(.variant == "dark") | .id' -r
}

tinty_list_light() {
  local prefer=${TINTY_PREFER-dark}
  tinty list --json | jq '.[] | select(.variant == "dark") | .id' -r
}

tinty_list() {
  local prefer=${TINTY_PREFER-dark}
  tinty_list_${prefer}
}

tinty_select() {
  tinty apply $(tinty_list | fzf --cycle --height=10)
}

tinty_random() {
  local new_theme=$(tinty_list | ruby -e '
    all = $stdin.readlines
    puts all.sample.chomp
  ')
  echo current: $(tinty current)
  echo next: $new_theme
  tinty apply $new_theme
}

tinty_choose() {
  local next_theme=$(tinty_list | ruby -e '                                                                                                                                                                                0
    all = $stdin.readlines.collect(&:chomp)
    current = ARGV.at(-2)
    dir = ARGV.last.to_i
    next_idx = all.index(current) + dir
    # p [current, dir, next_idx]
    next_theme = all[next_idx % all.size]
    puts next_theme
  ' -- "$(tinty current)" $1)
  echo current: $(tinty current)
  echo next: $next_theme
  tinty apply $next_theme
}

tinty_next() {
  tinty_choose 1
}

tinty_prev() {
  tinty_choose -1
}

#######################
# /end base16 stuff
#######################

define_run () {
  last=${history[@][1]}
  echo 'last is:' $last
  eval 'run () { set -x; ' $last ' $@; }'
}

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Teladoc local tools – highest PATH priority
export PATH="$HOME/.local/bin:$PATH"
