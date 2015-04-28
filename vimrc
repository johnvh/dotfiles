"
" TODO:
"   - figure out html w/ embedded js syntax issues
"

"pathogen init
execute pathogen#infect()

" leader key
let mapleader = ','

function! SetTabLength(length)
    execute "setl tabstop=".a:length
    execute "setl shiftwidth=".a:length
    execute "setl softtabstop=".a:length
endfunction

set incsearch	"show search results as you type
set ignorecase	"ignore case in search patterns
set smartcase	"override ignorecase if pattern contains upper case chars
set hls			"highlight all search matches
set autoindent			"new lines use indent of previous line
set expandtab
call SetTabLength(4)
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
set laststatus=2
set nojoinspaces   " don't double space sentences when using `gq`
set splitbelow     " open v split under current buffer
set relativenumber

let g:indentLine_char = '¦'
set wildignore+=*coverage/*
set modeline
set modelines=5

syntax on "turn on syntax highlight
syntax enable

"Stop removing indent from empty lines
"nnoremap o o<Space><BS>
"<C-l> clears search too
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


"disable the F1 help key - always hit it by accident
map <F1> <Esc>
imap <F1> <Esc>

filetype plugin indent on
filetype on

"set dictionary+=~/.vim/actionscript.vim
autocmd BufNewFile,BufRead *.as set syntax=actionscript 

"ruby filetype
au BufRead,BufNewFile {Rakefile,RakeFile,Capfile,capfile,Gemfile} set ft=ruby
au FileType ruby call SetTabLength(2)
au FileType eruby call SetTabLength(2)
autocmd FileType ruby map <F6> :!ruby -c %<CR>

"python filetype
au BufRead,BufNewFile {fabfile} set ft=python

"handlebars filetype => mustache
au BufRead,BufNewFile {hb,hbs,handlebars} set ft=mustache

"nginx conf
au BufRead,BufNewFile *nginx.conf set ft=nginx 

au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

"github flavored markdown plugin
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

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

set background=dark
colorscheme solarized
