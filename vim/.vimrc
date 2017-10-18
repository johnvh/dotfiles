call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-dirvish'
Plug 'altercation/vim-colors-solarized'
Plug 'ddollar/nerdcommenter'
" Plug 'pangloss/vim-javascript'
" Plug 'tpope/vim-markdown'
Plug 'vim-scripts/Conque-Shell'
Plug 'tpope/vim-git'
" Plug 'juvenn/mustache.vim'
Plug 'kien/ctrlp.vim'
" Plug 'jinfield/vim-nginx'
" Plug 'groenewege/vim-less'
" Plug 'jtratner/vim-flavored-markdown'
Plug 'bronson/vim-visual-star-search'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
" Plug 'cakebaker/scss-syntax.vim'
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-node'
" Plug 'scrooloose/syntastic'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
" Plug 'Shougo/vimproc.vim'
Plug 'Quramy/tsuquyomi'
" Plug 'nikvdp/ejs-syntax'

" TODO research:
" Plug 'Yggdroot/indentLine'
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

set background=dark
colorscheme solarized

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

nnoremap <F6> :SyntasticCheck<CR>

" map <Leader>ll :ll<CR>
" map <Leader>ln :lnext<CR>
" map <Leader>lp :lprev<CR>
" map <Leader>lc :lclose<CR>
nnoremap <silent> <Plug>LocationPrevious :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext     :<C-u>exe 'call <SID>LocationNext()'<CR>
nnoremap <silent> <Leader>lp <Plug>LocationPrevious
nnoremap <silent> <Leader>ln <Plug>LocationNext
nnoremap <Leader>lc :lclose<CR>

" =========================================================================== "
" plugin settings
" =========================================================================== "

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

" For indentLine
let g:indentLine_char = '¦'

" dont conceal json quotes, its annoying
let g:vim_json_syntax_conceal = 0

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

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

"disable syntastic on a per buffer basis (some work files blow it up)
function! SyntasticToggleBuffer()
  let b:syntastic_mode = "passive"
  SyntasticReset
  echo 'Syntastic disabled for this buffer'
endfunction

command! SyntasticToggleBuffer call SyntasticToggleBuffer()

" tsuquyomi + syntastic integration
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" =========================================================================== "
" other
" =========================================================================== "

function! SetTabLength(length)
  execute "setlocal tabstop=".a:length
  execute "setlocal shiftwidth=".a:length
  execute "setlocal softtabstop=".a:length
endfunction

" include ~/.vimrc.local if found for local overrides
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
