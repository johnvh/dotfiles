" unqoutes json keys, replaces " with '
function! JsonToJs() range
  silent! execute a:firstline . "," . a:lastline . 's/\v"([^""]+)" ?:/\1:/g'
  silent! execute a:firstline . "," . a:lastline . 's/"/''/g'
endfunction

" does above conversions, replaces mongo specific types
function! RoboMongoJsonToJs() range
    " call JsonToJs(), but how to pass range?
    silent! execute a:firstline . "," . a:lastline . 's/\v"([^""]+)" ?:/\1:/g'
    silent! execute a:firstline . "," . a:lastline . 's/"/''/g'
    silent! execute a:firstline . "," . a:lastline . 's/ISODate/new Date/ge'
    silent! execute a:firstline . "," . a:lastline . 's/\v\s+$//ge'
endfunction

vnoremap <Leader>js :call JsonToJs()<CR>
vnoremap <Leader>jsr :call RoboMongoJsonToJs()<CR>
