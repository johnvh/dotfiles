function! s:formatx12()
  silent! execute a:firstline . "," . a:lastline . 's/\~/\~
endfunction

command X12format call s:formatx12()