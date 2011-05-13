"pathogen enable
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set incsearch	"show search results as you type
set ignorecase	"ignore case in search patterns
set smartcase	"override ignorecase if pattern contains upper case chars
set hls			"highlight all search matches

"indenting
set autoindent			"new lines use indent of previous line
"Stop removing indent from empty lines
nnoremap o o<Space><BS>
"#set smartindent		"typing # in normal mode remove indentation

"tabs
set tabstop=4
set shiftwidth=4

"disable the F1 help key - always hit it by accident
map <F1> <Esc>
imap <F1> <Esc>

set ruler							"always show ruler
set scrolloff=3						"keep lines visible when scrolling
set backspace=indent,eol,start		"can backspace to prev line
set listchars=tab:\⋮\ ,trail:-,eol:¬	"show these chars in list mode
set number							"show line numbers
set showmatch						"on insert bracket, show matching bracket
set pastetoggle=<f8>				"make F8 toggle paste/nopaste
set nowrap							"no soft wrap by default
set encoding=utf-8					"use utf 8

"nmap <F2> V"ay
"nmap <F3> V"Ay
"nmap <F4> "ap

syntax on
"set dictionary+=~/.vim/actionscript.vim
autocmd BufNewFile,BufRead *.as set syntax=actionscript 
colorscheme torte


function! ShitIAmLearning()
	echo 'New stuff:'
	echo '	Visual Ops:'
	echo '		vi[ - select inner [ ]'
	echo '	Buffer recall:'
	echo '		<C-r>" - recall register "'
	echo '	Help Search:'
	echo '		:help foo<c-d>'
endfunction

