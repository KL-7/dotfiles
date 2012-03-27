setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
" setlocal textwidth=80

" check python code on :make, run on <F5>
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
map <buffer> <F5> :w<CR>:!clear; /usr/bin/env python % <CR>

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
