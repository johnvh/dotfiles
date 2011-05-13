colorscheme neverness
set guifont=Inconsolata:h14

" Include ~/.givmrc.local if exists for local overrides
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
  endif
