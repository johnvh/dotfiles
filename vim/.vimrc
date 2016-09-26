"
" TODO:
"   - figure out html w/ embedded js syntax issues
"

"pathogen init
runtime pathogen/autoload/pathogen.vim
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
set ruler							"always show ruler
set scrolloff=3						"keep lines visible when scrolling
set backspace=indent,eol,start		"can backspace to prev line
set listchars=nbsp:¬,tab:\⋮\ ,trail:-,eol:¶	"show these chars in list mode
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
set wildignore+=*coverage/*
set modeline
set modelines=5
set splitright
" don't automatically resize splits
set noequalalways

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

"ft=sh for bash fc or ctrl-x ctrl-e
au BufRead,BufNewFile bash-fc-* set filetype=sh
autocmd FileType sh set textwidth=0

"ruby filetype
au BufRead,BufNewFile {Rakefile,RakeFile,Capfile,capfile,Gemfile,Vagrantfile} set ft=ruby
au FileType ruby call SetTabLength(2)
au FileType eruby call SetTabLength(2)
autocmd FileType ruby map <F6> :!ruby -c %<CR>

"python filetype
au BufRead,BufNewFile {fabfile} set ft=python

"handlebars filetype => mustache
au BufRead,BufNewFile {hb,hbs,handlebars} set ft=mustache

"nginx conf
au BufRead,BufNewFile *nginx.conf* set ft=nginx

au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

"github flavored markdown plugin
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" NERDTree configuration
" - map Leader-n, to toggle nerdtree tray
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

" NERDCommenter config
" - Leader-/ to toggle comments
map <Leader>/ <plug>NERDCommenterToggle<CR>
imap <Leader>/ <Esc><plug>NERDCommenterToggle<CR>i

" For indentLine
let g:indentLine_char = '¦'
nmap <Leader>ig :IndentLinesToggle<CR>

" include ~/.vimrc.local if found for local overrides
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

set background=dark
colorscheme solarized

" vim-snipmate trigger
imap <D-'> <esc>a<Plug>snipMateNextOrTrigger
smap <D-'> <Plug>snipMateNextOrTrigger
imap <Leader>ss <esc>a<Plug>snipMateShow

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers=['jsonlint']

" Fix syntastic error jumping
function! <SID>LocationPrevious()
  try
    lprev
  catch /^Vim\%((\a\+)\)\=:E553/
    llast
  endtry
endfunction

function! <SID>LocationNext()
  try
    lnext
  catch /^Vim\%((\a\+)\)\=:E553/
    lfirst
  endtry
endfunction

" dont conceal json quotes, its annoying
let g:vim_json_syntax_conceal = 0

"disable syntastic on a per buffer basis (some work files blow it up)
function! SyntasticToggleBuffer()
	let b:syntastic_mode = "passive"
	SyntasticReset
	echo 'Syntastic disabled for this buffer'
endfunction

command! SyntasticToggleBuffer call SyntasticToggleBuffer()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tsuquyomi + syntastic integration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

""""
runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Leader>t2 :call SetTabLength(2)<CR>:IndentLinesReset<CR>
map <Leader>t4 :call SetTabLength(4)<CR>:IndentLinesReset<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

map <Leader>nn :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

map <Leader>w :set wrap!<CR>

map <F6> :SyntasticCheck<CR>

" map <Leader>ll :ll<CR>
" map <Leader>ln :lnext<CR>
" map <Leader>lp :lprev<CR>
" map <Leader>lc :lclose<CR>
nnoremap <silent> <Plug>LocationPrevious :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext     :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> <Leader>lp <Plug>LocationPrevious
nmap <silent> <Leader>ln <Plug>LocationNext
map <Leader>lc :lclose<CR>
