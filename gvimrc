syntax enable
set background=dark
colorscheme solarized

set guifont=Inconsolata:h14

" Include ~/.givmrc.local if exists for local overrides
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
  endif
