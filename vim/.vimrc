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
Plug 'tpope/vim-git'
Plug 'bronson/vim-visual-star-search'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'bronson/vim-trailing-whitespace'
if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/tsuquyomi'
endif
Plug 'Quramy/vim-js-pretty-template'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
" Plug 'scrooloose/nerdtree'
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
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" text objects
Plug 'kana/vim-textobj-user'
" FIXME these both register the txtobj 'c'
Plug 'poetic/vim-textobj-javascript'
Plug 'glts/vim-textobj-comment'

" assumes fzf brew installed
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/confluencewiki.vim'

Plug '~/.vim/plugged/notes'
Plug '~/.vim/plugged/x12'

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
set hidden
set grepprg=rg\ --vimgrep

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

" vnoremap <leader>f :Neoformat<Cr>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"



" maybe
command! -nargs=0 Gitbranch :r! git rev-parse --abbrev-ref HEAD<CR>



" coc.vim stuff

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)<Paste>

" vmap <leader>f <Plug>(coc-format-selected)
" nmap <leader>f <Plug>(coc-format-selected)



" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>




" =========================================================================== "
" plugin settings
" =========================================================================== "

let g:polyglot_disabled = ['markdown']

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
let g:ale_set_highlights = 0

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
let g:vim_markdown_folding_disabled = 1

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
