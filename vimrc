"
" TODO:
"   - figure out html w/ embedded js syntax issues
"

"pathogen enable
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" leader key
let mapleader = ','

function SetTabLength(length)
    execute "set tabstop=".a:length
    execute "set shiftwidth=".a:length
    execute "set softtabstop=".a:length
endfunction

set incsearch	"show search results as you type
set ignorecase	"ignore case in search patterns
set smartcase	"override ignorecase if pattern contains upper case chars
set hls			"highlight all search matches
set autoindent			"new lines use indent of previous line
set expandtab
call SetTabLength(4)
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
set ruler							"always show ruler
set scrolloff=3						"keep lines visible when scrolling
set backspace=indent,eol,start		"can backspace to prev line
set listchars=tab:\⋮\ ,trail:-,eol:¬	"show these chars in list mode
set number							"show line numbers
set showmatch						"on insert bracket, show matching bracket
set pastetoggle=<f8>				"make F8 toggle paste/nopaste
set nowrap							"no soft wrap by default
set encoding=utf-8					"use utf 8
set textwidth=80
set cursorline  "higlight current line

syntax on "turn on syntax highlight
syntax enable

"Stop removing indent from empty lines
nnoremap o o<Space><BS>

"disable the F1 help key - always hit it by accident
map <F1> <Esc>
imap <F1> <Esc>

filetype plugin indent on
filetype on

"set dictionary+=~/.vim/actionscript.vim
autocmd BufNewFile,BufRead *.as set syntax=actionscript 

"ruby filetype
au BufRead,BufNewFile {Rakefile,RakeFile} set ft=ruby

"handlebars filetype => mustache
au BufRead,BufNewFile {hb,hbs,handlebars} set ft=mustache

"nginx conf
au BufRead,BufNewFile *nginx.conf set ft=nginx 

" NERDTree configuration
" - map Leader-n, to toggle nerdtree tray
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" NERDCommenter config
" - Leader-/ to toggle comments
map <Leader>/ <plug>NERDCommenterToggle<CR>
imap <Leader>/ <Esc><plug>NERDCommenterToggle<CR>i

" include ~/.vimrc.local if found for local overrides
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

