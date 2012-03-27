setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab

map <buffer> <F5> :w<CR>:!clear; /usr/bin/env ruby % <CR>

" comment/uncomment lines
func! TogglePythonComment()
 let line = getline(".")
 if line[0] == '#'
  call setline(".", line[1:])
 else
  call setline(".", "#".line)
 endif 
endf
map <silent><c-_> :call TogglePythonComment()<Esc>
