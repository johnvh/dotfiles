" notes.vim - simple weekly notes
" Maintainer: John Vh <jmvanhorn@gmail.com>

function! s:notesDir()
  let dir = empty($VIM_NOTES_DIR) ? $HOME . '/notes' : $VIM_NOTES_DIR
  if !isdirectory(dir)
    call mkdir(dir, 'p')
  end
  return dir
endfunction

function! s:monday()
  return substitute(system("ruby -rdate -e 'puts (Date.today - Date.today.cwday + 1).strftime(\"%Y-%m-%d\")'"), '\_s*$', '', 'g')
endfunction

function! s:mondayHeadline()
  return "# Week of " . s:monday()
endfunction

function! s:newFileContents()
  return [s:mondayHeadline(), '', '<!-- vim: set nospell: -->']
endfunction

function! s:notes() abort
  let fn = s:notesDir() . '/' . s:monday() . '.md'
  if !filereadable(fn)
    call writefile(s:newFileContents(), fn)
  end
  execute ":edit " . fn
endfunction

command! Notes call s:notes()
