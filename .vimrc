""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype on
filetype plugin on
filetype plugin indent on

set bg=dark

if has("gui_running")
	colorscheme desert
else
	colorscheme 256-kl7
end

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab

set autowrite
set autowriteall

set ruler
set number
set showcmd
set nowrap
set smartcase
set ignorecase
set incsearch

set laststatus=2

" spellcheck in gittcommit
autocmd Syntax gitcommit setlocal spell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" help navigating with Enter/Backspace
" nnoremap <buffer> <CR> <C-]>
" nnoremap <buffer> <BS> <C-T>

" toggle line numbers
map <silent><F2> :set number!<CR>

" prevent i+<Esc> from moving cursor
" inoremap <Esc> <Esc>`^

" remap omnicunf (pythonCompletition) to Ctrl+Spaces
inoremap <Nul> <C-x><C-o>

" tab switch on Alt+arrow
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

" WinManager mappings
map <F7> :FirstExplorerWindow<cr>
map <F8> :BottomExplorerWindow<cr>
map <F6> <c-w><c-w>
map <c-w><c-t> :WMToggle<cr>

map <F3> :WMToggle<CR>
map <F4> :TlistToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Setting viewports
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let Tlist_Auto_Open = 1
let Tlist_WinWidth = 25
let Tlist_Use_Right_Window = 1
let g:winManagerWidth = 22

let g:bufExplorerDefaultHelp = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://concisionandconcinnity.blogspot.com/search/label/vim "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto-close for non-quotes
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
" autocmd Syntax html,vim inoremap < <lt>><Left>

function! ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
  return "\<Right>"
 else
  return a:char
 endif
endf

inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>

function! QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
  "Inserting a quoted quotation mark into the string
  return a:char
 elseif line[col - 1] == a:char
  "Escaping out of the string
  return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Left>"
endif
endf

" inoremap " <c-r>=QuoteDelim('"')<CR>
" inoremap ' <c-r>=QuoteDelim("'")<CR>
" unmap in vim config files
" autocmd Syntax vim inoremap " "

" Backspace in empty pair deletes both
function! InAnEmptyPair()
 let cur = strpart(getline('.'),getpos('.')[2]-2,2)
 for pair in (split(&matchpairs,',') + ['":"',"':'"])
  if cur == join(split(pair,':'),'')
   return 1
  endif
 endfor
 return 0
endfunc

func! DeleteEmptyPairs()
 if InAnEmptyPair()
  return "\<Left>\<Del>\<Del>"
 else
  return "\<BS>"
 endif
endfunc

inoremap <expr> <BS> DeleteEmptyPairs()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/ "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Preserve(command)
 " Preparation: save last search, and cursor position.
 let _s=@/
 let l = line(".")
 let c = col(".")
 " Do the business:
 execute a:command
 " Clean up: restore previous search history, and cursor position
 let @/=_s
 call cursor(l, c)
endfunc

function! TrimTrailingSpaces()
 call Preserve("%s/\\s\\+$//e")
endfunc

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" let g:CL_lispwords_file="~/.vim/lispwords"
