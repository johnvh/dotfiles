" unqoutes json keys, replaces " with '
function! JsonToJs()
  execute a:firstline . "," . a:lastline . '%s/\v"([^""]+)" ?:/\1:/ge'
  execute a:firstline . "," . a:lastline . '%s/"/\'/g'
endfunction

" does above conversions, replaces mongo specific types
function! RoboMongoJsonToJs() range
    call JsonToJs()
    silent! execute a:firstline . "," . a:lastline . '%s/ISODate/new Date/ge'
    silent! execute a:firstline . "," . a:lastline . '%s/\v\s+$//ge'
endfunction

command! -range JsonToJs <line1>,<line2>call JsonToJs()

" vnoremap <Leader>mm :call JsonToJs()<CR>
" vmap <Leader>rjson :call RoboMongoJsonToJs()<CR>
