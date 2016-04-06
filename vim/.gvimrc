set background=dark
colorscheme solarized

"set guifont=Inconsolata:h14
"set guifont=Monaco:h14
set guifont=Bitstream\ Vera\ Sans\ Mono:h14

" NERDCommenter config
" - Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Include ~/.givmrc.local if exists for local overrides
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
