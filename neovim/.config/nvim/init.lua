local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

require("lazy").setup({
  -- {dir = '/usr/local/opt/fzf'},
  -- 'junegunn/fzf.vim',
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup({})
    end
  },
  'vim-scripts/confluencewiki.vim',
  {dir = '~/.vim/plugged/notes'},
  {dir = '~/.vim/plugged/x12'},


  -- 'sheerun/vim-polyglot',
  'tpope/vim-sleuth',
  'tpope/vim-eunuch',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',
  'justinmk/vim-dirvish',
  'ddollar/nerdcommenter',
  'tpope/vim-git',
  'bronson/vim-visual-star-search',
  'itchyny/lightline.vim',
  'maximbaz/lightline-ale',
  'tpope/vim-fugitive',
  'tpope/vim-rails',
  'vim-ruby/vim-ruby',
  -- Plug 'bronson/vim-trailing-whitespace'
  -- Plug 'neoclide/coc.nvim', {'branch': 'release'}

  -- Plug 'MarcWeber/vim-addon-mw-utils'
  -- Plug 'garbas/vim-snipmate'
  -- " Plug 'scrooloose/nerdtree'
  'moll/vim-node',
  'elzr/vim-json',
  -- Plug 'yggdroot/indentline'
  -- Plug 'w0rp/ale'
  -- Plug 'chriskempson/base16-vim'
  'christoomey/vim-tmux-navigator',
  'benmills/vimux',
  -- Plug 'raimondi/delimitmate'
  -- Plug 'sbdchd/neoformat'
  -- Plug 'depuracao/vim-rdoc'
  'plasticboy/vim-markdown',

  -- " text objects
  -- Plug 'kana/vim-textobj-user'
  -- " FIXME these both register the txtobj 'c'
  -- Plug 'poetic/vim-textobj-javascript'
  -- Plug 'glts/vim-textobj-comment'

  -- 'tinted-theming/base16-vim'

  'lukas-reineke/indent-blankline.nvim',
})

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
  char = '⁚'
}


--local cmd = vim.cmd
--local g = vim.g
--
--local current_theme_name = os.getenv('BASE16_THEME')
--if current_theme_name and vim.g.colors_name ~= 'base16-'..current_theme_name then
--  vim.cmd('let base16colorspace=256')
--  vim.cmd('colorscheme base16-'..current_theme_name)
--end
--
--
--
--local fn = vim.fn
--local cmd = vim.cmd
--local set_theme_path = "$HOME/.config/tinted-theming/set_theme.lua"
--local is_set_theme_file_readable = vim.fn.filereadable(vim.fn.expand(set_theme_path)) == 1 and true or false
--if is_set_theme_file_readable then
--  vim.cmd("let base16colorspace=256")
--  vim.cmd("source " .. set_theme_path)
--end



-- #########################################################################################

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hls = true
vim.opt.autoindent = true
vim.opt.ruler = true
vim.opt.scrolloff = 3 -- keep lines visible when scrolling
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.listchars = { space = '·', tab = '›⋮', eol = '↲', trail = '∙' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.pastetoggle = '<f8>'
vim.opt.wrap = false
vim.opt.textwidth = 80
-- vim.opt.cursorline = true
vim.opt.exrc = true  -- enable local/per-directory .vimrc files
vim.opt.secure = true -- disable unsafe commands in local .vimrc files
vim.opt.laststatus = 2
vim.opt.joinspaces = false -- don't double space sentences when using `gq`
vim.opt.splitbelow = true -- open v split under current buffer
vim.opt.splitright = true -- open h split to right
vim.opt.equalalways = false -- don't automatically resize splits
-- set wildignore+=*coverage/*
vim.opt.modeline = true
vim.opt.modelines = 5
vim.opt.lazyredraw = true
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.grepprg = 'rg --vimgrep'

vim.api.nvim_set_option('clipboard', 'unnamed')

-- ###############

-- Wrapped lines goes down/up to next row, rather than next line in file.
-- noremap j gj
vim.keymap.set('n', 'j', 'gj')
-- noremap k gk
vim.keymap.set('n', 'k', 'gk')

-- Visual shifting (does not exit Visual mode)
vim.keymap.set({'v'}, '<', '<gv', { noremap = true })
vim.keymap.set({'v'}, '>', '>gv', { noremap = true })

-- nnoremap Y y$
vim.keymap.set("n", "Y", "y$")

vim.keymap.set('n', '<leader>src', ':source $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>ee', ':e $MYVIMRC<CR>')

-- nnoremap <leader>t4 :call SetTabLength(4)<CR>
-- nnoremap <leader>t2 :call SetTabLength(2)<CR>

-- function! SetTabLength(length)
--   execute "setlocal tabstop=".a:length
--   execute "setlocal shiftwidth=".a:length
--   execute "setlocal softtabstop=".a:length
--   if exists(":IndentLinesReset")
--     execute "IndentLinesReset"
--   endif
-- endfunction

-- clear search
-- nnoremap <silent> <leader>l :noh<CR>
vim.keymap.set('n', '<leader>l', ':noh<CR>', { silent = true })

-- disable the F1 help key - always hit it by accident
-- map <F1> <Esc>
-- imap <F1> <Esc>

-- NERDCommenter config
vim.keymap.set({'n', 'i', 'v'}, '<leader>/', '<plug>NERDCommenterToggle<CR>')

-- nnoremap <Leader>ig :IndentLinesToggle<CR>
vim.keymap.set({'n'}, '<Leader>ig', ':IndentLinesToggle<CR>')

-- " vim-snipmate trigger
-- inoremap <D-'> <esc>a<Plug>snipMateNextOrTrigger
--
-- snoremap <D-'> <Plug>snipMateNextOrTrigger
-- inoremap <Leader>ss <esc>a<Plug>snipMateShow

vim.keymap.set('n', '<leader>tc',  ':VimuxPromptCommand<CR>')
vim.keymap.set('n', '<leader>tl',  ':VimuxRunLastCommand<CR>')
vim.keymap.set('n', '<leader>ww',  ':w<CR>:VimuxRunLastCommand<CR>')
vim.keymap.set('n', '<leader>tt',  ':silent exec "!_tmux_exit_copy_mode > /dev/null 2>&1"<CR>')
vim.keymap.set('n', '<leader>tv0', ':let g:VimuxRunnerIndex=0<CR>')
vim.keymap.set('n', '<leader>tv1', ':let g:VimuxRunnerIndex=1<CR>')
vim.keymap.set('n', '<leader>tv2', ':let g:VimuxRunnerIndex=2<CR>')


-- not using ale right now
-- nmap [ll <Plug>(ale_previous_wrap)
-- nmap ]ll <Plug>(ale_next_wrap)




-- " maybe
-- command! -nargs=0 Gitbranch :r! git rev-parse --abbrev-ref HEAD<CR>

vim.keymap.set('n', '<C-p>', '<cmd>lua require("fzf-lua").files()<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', '<cmd>lua require("fzf-lua").buffers()<CR>', { silent = true })
vim.keymap.set('n', '<leader>,', '<C-6>', { silent = true })


-- ################## coc.vim stuff

-- inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
vim.keymap.set('i', '<expr><tab>', 'pumvisible() ? "<c-n>" : "<tab>"')


-- " nmap <silent> gd <Plug>(coc-definition)
-- " nmap <silent> gy <Plug>(coc-type-definition)
-- " nmap <silent> gi <Plug>(coc-implementation)
-- " nmap <silent> gr <Plug>(coc-references)<Paste>

-- " vmap <leader>f <Plug>(coc-format-selected)
-- " nmap <leader>f <Plug>(coc-format-selected)

vim.opt.backup = false
vim.opt.writebackup = false

-- " Better display for messages
-- set cmdheight=2

-- " You will have bad experience for diagnostic messages when it's default 4000.
-- set updatetime=300

-- " don't give |ins-completion-menu| messages.
-- set shortmess+=c

-- " always show signcolumns
-- set signcolumn=yes

-- " Use tab for trigger completion with characters ahead and navigate.
-- " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
-- inoremap <silent><expr> <TAB>
--       \ pumvisible() ? "\<C-n>" :
--       \ <SID>check_back_space() ? "\<TAB>" :
--       \ coc#refresh()
-- inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

-- function! s:check_back_space() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- " Use <c-space> to trigger completion.
-- inoremap <silent><expr> <c-space> coc#refresh()

-- " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
-- " Coc only does snippet and additional edit on confirm.
-- inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
-- " Or use `complete_info` if your vim support it, like:
-- " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

-- " Use `[g` and `]g` to navigate diagnostics
-- nmap <silent> [g <Plug>(coc-diagnostic-prev)
-- nmap <silent> ]g <Plug>(coc-diagnostic-next)

-- " Remap keys for gotos
-- nmap <silent> gd <Plug>(coc-definition)
-- nmap <silent> gy <Plug>(coc-type-definition)
-- nmap <silent> gi <Plug>(coc-implementation)
-- nmap <silent> gr <Plug>(coc-references)

-- " Use K to show documentation in preview window
-- nnoremap <silent> K :call <SID>show_documentation()<CR>

-- function! s:show_documentation()
--   if (index(['vim','help'], &filetype) >= 0)
--     execute 'h '.expand('<cword>')
--   else
--     call CocAction('doHover')
--   endif
-- endfunction

-- " Highlight symbol under cursor on CursorHold
-- autocmd CursorHold * silent call CocActionAsync('highlight')

-- " Remap for rename current word
-- nmap <leader>rn <Plug>(coc-rename)

-- " Remap for format selected region
-- xmap <leader>f  <Plug>(coc-format-selected)
-- nmap <leader>f  <Plug>(coc-format-selected)

-- augroup mygroup
--   autocmd!
--   " Setup formatexpr specified filetype(s).
--   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
--   " Update signature help on jump placeholder
--   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
-- augroup end

-- " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
-- xmap <leader>a  <Plug>(coc-codeaction-selected)
-- nmap <leader>a  <Plug>(coc-codeaction-selected)

-- " Remap for do codeAction of current line
-- nmap <leader>ac  <Plug>(coc-codeaction)
-- " Fix autofix problem of current line
-- nmap <leader>qf  <Plug>(coc-fix-current)

-- " Create mappings for function text object, requires document symbols feature of languageserver.
-- xmap if <Plug>(coc-funcobj-i)
-- xmap af <Plug>(coc-funcobj-a)
-- omap if <Plug>(coc-funcobj-i)
-- omap af <Plug>(coc-funcobj-a)

-- " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
-- nmap <silent> <C-d> <Plug>(coc-range-select)
-- xmap <silent> <C-d> <Plug>(coc-range-select)

-- " Use `:Format` to format current buffer
-- command! -nargs=0 Format :call CocAction('format')

-- " Use `:Fold` to fold current buffer
-- command! -nargs=? Fold :call     CocAction('fold', <f-args>)

-- " use `:OR` for organize import of current buffer
-- command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

-- " Add status line support, for integration with other plugin, checkout `:h coc-status`
-- " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

-- " Using CocList
-- " Show all diagnostics
-- nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
-- " Manage extensions
-- nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
-- " Show commands
-- nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
-- " Find symbol of current document
-- nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
-- " Search workspace symbols
-- nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
-- " Do default action for next item.
-- nnoremap <silent> <space>j  :<C-u>CocNext<CR>
-- " Do default action for previous item.
-- nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
-- " Resume latest coc list
-- nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



-- " =========================================================================== "
-- " plugin settings
-- " =========================================================================== "

-- let g:polyglot_disabled = ['markdown', 'ruby']
vim.g.polyglot_disabled = { 'markdown', 'ruby' }

-- " For indentLine
-- " let g:indentLine_char = '¦'
-- let g:indentLine_char_list = ['⁝', '│']
-- " let g:indentLine_char_list = ['⁝', '¦', , '┊', '', '│']

-- dont conceal json quotes, its annoying
-- let g:vim_json_syntax_conceal = 0
vim.g.vim_json_syntax_conceal = 0

-- let g:ale_linters = {
-- \   'javascript': ['eslint'],
-- \}
-- let g:ale_fixers = {
-- \   'javascript': ['eslint'],
-- \}
-- let g:ale_sign_error = '>>'
-- let g:ale_sign_warning = '--'
-- let g:ale_set_highlights = 0

-- let g:lightline = {
--   \ 'active': {
--   \   'left': [
--   \     ['mode', 'paste'],
--   \     ['readonly', 'gitbranch', 'filename', 'modified']
--   \   ],
--   \   'right': [
--   \     ['lineinfo'],
--   \     ['percent'],
--   \     ['fileformat', 'fileencoding', 'filetype'],
--   \     ['linter_errors', 'linter_warnings']
--   \   ]
--   \ },
--   \ 'component_function': {
--   \   'gitbranch': 'fugitive#head'
--   \ },
--   \ 'component_expand': {
--   \   'linter_checking': 'lightline#ale#checking',
--   \   'linter_warnings': 'lightline#ale#warnings',
--   \   'linter_errors': 'lightline#ale#errors',
--   \   'linter_ok': 'lightline#ale#ok',
--   \ },
--   \ 'component_type': {
--   \   'linter_checking': 'left',
--   \   'linter_warnings': 'warning',
--   \   'linter_errors': 'error',
--   \   'linter_ok': 'left',
--   \ },
--   \ 'mode_map': {
--   \   'n' : 'N',
--   \   'i' : 'I',
--   \   'R' : 'R',
--   \   'v' : 'v',
--   \   'V' : 'V',
--   \   "\<C-v>": '^V',
--   \   'c' : 'C',
--   \   's' : 's',
--   \   'S' : 'S',
--   \   "\<C-s>": '^S',
--   \   't': 'T',
--   \ }
-- \ }

vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_folding_disabled = 1
-- vim.g.vim_markdown_fenced_languages = [
--   \ 'js=javascript',
--   \ 'rb=ruby',
--   \ 'yml=yaml'
-- \ ]


-- " =========================================================================== "
-- " other
-- " =========================================================================== "

-- augroup autochecktime
--   autocmd CursorHold,CursorHoldI * checktime
-- augroup END


-- " include ~/.vimrc.local if found for local overrides
-- if filereadable(expand("~/.vimrc.local"))
--   source ~/.vimrc.local
-- endif



----- #########################################################################################################3


