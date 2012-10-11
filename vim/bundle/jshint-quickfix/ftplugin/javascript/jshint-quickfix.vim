" Run `jshint` on current buffer, and open quickfix window if any errors are
" reported.
" 
" * Assumes `jshint` program is on your path.

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
setlocal makeprg=jshint\ % 

nmap <buffer> <F6> :make<CR><CR>
