call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-dirvish'
Plug 'altercation/vim-colors-solarized'
Plug 'ddollar/nerdcommenter'
Plug 'vim-scripts/Conque-Shell'
Plug 'tpope/vim-git'
Plug 'bronson/vim-visual-star-search'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'bronson/vim-trailing-whitespace'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
else
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/tsuquyomi'
endif
Plug 'Quramy/vim-js-pretty-template'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'yggdroot/indentline'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'raimondi/delimitmate'
Plug 'sbdchd/neoformat'
Plug 'depuracao/vim-rdoc'

" text objects
Plug 'kana/vim-textobj-user'
" FIXME these both register the txtobj 'c'
Plug 'poetic/vim-textobj-javascript'
Plug 'glts/vim-textobj-comment'

" assumes fzf brew installed
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/confluencewiki.vim'

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
set autoread
set grepprg=rg\ --vimgrep

" set background=dark
"set t_Co=256
"colorscheme solarized
" let base16colorspace=256
" colorscheme base16-default-dark
" colorscheme base16-3024
" colorscheme base16-harmonic-dark

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" extended % matching
runtime macros/matchit.vim

" =========================================================================== "
" keys
" =========================================================================== "

let mapleader = ','


nnoremap Y y$

nnoremap <leader>src :source $MYVIMRC<CR>
nnoremap <leader>ee :new $MYVIMRC<CR>

nnoremap <leader>t4 :call SetTabLength(4)<CR>
nnoremap <leader>t2 :call SetTabLength(2)<CR>

" clear search
nnoremap <silent> <leader>l :noh<CR>

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

nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>tc :VimuxPromptCommand<CR>
nnoremap <leader>tl :VimuxRunLastCommand<CR>
nnoremap <leader>ww :w<CR>:VimuxRunLastCommand<CR>
nnoremap <leader>tt :silent exec "!_tmux_exit_copy_mode > /dev/null 2>&1"<CR>
nnoremap <leader>tv0 :let g:VimuxRunnerIndex=0<CR>
nnoremap <leader>tv1 :let g:VimuxRunnerIndex=1<CR>
nnoremap <leader>tv2 :let g:VimuxRunnerIndex=2<CR>

nmap [ll <Plug>(ale_previous_wrap)
nmap ]ll <Plug>(ale_next_wrap)

vnoremap <leader>f :Neoformat<Cr>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


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
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:lightline = {
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'gitbranch', 'filename', 'modified']
  \   ],
  \   'right': [
  \     ['lineinfo'],
  \     ['percent'],
  \     ['fileformat', 'fileencoding', 'filetype'],
  \     ['linter_errors', 'linter_warnings']
  \   ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ },
  \ 'mode_map': {
  \   'n' : 'N',
  \   'i' : 'I',
  \   'R' : 'R',
  \   'v' : 'v',
  \   'V' : 'V',
  \   "\<C-v>": '^V',
  \   'c' : 'C',
  \   's' : 's',
  \   'S' : 'S',
  \   "\<C-s>": '^S',
  \   't': 'T',
  \ }
\ }

let g:vim_markdown_conceal = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1
" call deoplete#enable_logging('DEBUG', '/PATH_TO/deoplete.log')

" =========================================================================== "
" other
" =========================================================================== "

augroup autochecktime
  autocmd CursorHold,CursorHoldI * checktime
augroup END

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
