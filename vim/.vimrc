call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'justinmk/vim-dirvish'
Plug 'altercation/vim-colors-solarized'
Plug 'ddollar/nerdcommenter'
Plug 'vim-scripts/Conque-Shell'
Plug 'tpope/vim-git'
Plug 'bronson/vim-visual-star-search'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'yggdroot/indentline'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
" assumes fzf brew installed
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" TODO research:
" vim-ale
" Plug 'spf13/vim-autoclose'

call plug#end()

" =========================================================================== "
" options
" =========================================================================== "

set incsearch
set ignorecase
set smartcase
set hls
set autoindent
set ruler
set scrolloff=3 "keep lines visible when scrolling
set backspace=indent,eol,start
set listchars=nbsp:¬,tab:\⋮\ ,trail:-,eol:¶
set number
set relativenumber
set showmatch
set pastetoggle=<f8>
set nowrap
set encoding=utf-8
set textwidth=80
set cursorline
set exrc "enable local/per-directory .vimrc files
set secure "disable unsafe commands in local .vimrc files
set laststatus=2
set nojoinspaces "don't double space sentences when using `gq`
set splitbelow "open v split under current buffer
set splitright "open h split to right
set noequalalways "don't automatically resize splits
set wildignore+=*coverage/*
set modeline
set modelines=5
set lazyredraw

set background=dark
set t_Co=256
colorscheme solarized
" let base16colorspace=256
" colorscheme base16-default-dark

" extended % matching
runtime macros/matchit.vim

" =========================================================================== "
" keys
" =========================================================================== "

let mapleader = ','

nnoremap <leader>src :source $MYVIMRC<CR>

nnoremap <leader>t4 :call SetTabLength(4)<CR>
nnoremap <leader>t2 :call SetTabLength(2)<CR>

"<C-l> clears search too
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"disable the F1 help key - always hit it by accident
map <F1> <Esc>
imap <F1> <Esc>

" NERDCommenter config
" Leader-/ to toggle comments
nmap <leader>/ <plug>NERDCommenterToggle<CR>
vmap <leader>/ <plug>NERDCommenterToggle<CR>
imap <leader>/ <Esc><plug>NERDCommenterToggle<CR>i

"nnoremap <Leader>ig :IndentLinesToggle<CR>

" vim-snipmate trigger
inoremap <D-'> <esc>a<Plug>snipMateNextOrTrigger
snoremap <D-'> <Plug>snipMateNextOrTrigger
inoremap <Leader>ss <esc>a<Plug>snipMateShow

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>nn :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

" map <Leader>w :set wrap!<CR>

nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)

nnoremap <C-p> :Files<CR>

" =========================================================================== "
" plugin settings
" =========================================================================== "

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

" For indentLine
let g:indentLine_char = '¦'

" dont conceal json quotes, its annoying
let g:vim_json_syntax_conceal = 0

" tsuquyomi + syntastic integration
let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" airline mode one letter
let g:airline_mode_map = {
\ '__' : '-',
\ 'n'  : 'N',
\ 'i'  : 'I',
\ 'R'  : 'R',
\ 'c'  : 'C',
\ 'v'  : 'V',
\ 'V'  : 'V',
\ '^V' : 'V',
\ 's'  : 'S',
\ 'S'  : 'S',
\ '^S' : 'S',
\}

" =========================================================================== "
" other
" =========================================================================== "

function! SetTabLength(length)
  execute "setlocal tabstop=".a:length
  execute "setlocal shiftwidth=".a:length
  execute "setlocal softtabstop=".a:length
  if exists(":IndentLinesReset")
    execute "IndentLinesReset"
  endif
endfunction

" include ~/.vimrc.local if found for local overrides
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
