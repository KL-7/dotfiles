" Vim color file
" Maintainer:    Kirill Lashuk <kirill.lashuk@gmail.com>

set bg=dark
set t_Co=256
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="kl7-256"
let python_highlight_all = 1
let c_gnu = 1

" hi Normal     ctermfg=255     ctermbg=0
hi Cursor                     cterm=reverse
hi Comment    ctermfg=247
hi Constant   ctermfg=121     cterm=bold
hi String     ctermfg=118
hi StringSpec ctermfg=48      cterm=bold
hi Statement  ctermfg=11      cterm=bold
hi Entity     ctermfg=214     cterm=none
hi Type       ctermfg=111     cterm=bold
hi Support    ctermfg=87
hi Special    ctermfg=118
hi LineNr     ctermfg=109
hi Todo       ctermfg=0       ctermbg=222
hi DiffText   ctermfg=15      ctermbg=1
" hi Error      ctermfg=15      ctermbg=1
" hi Title      ctermfg=#f6f3e8 ctermbg=NONE    cterm=bold
" hi NonText    ctermfg=#808080 ctermbg=#0D1021 cterm=none

hi Visual       cterm=reverse
" hi VertSplit    ctermfg=#444444 ctermbg=#444444
" hi StatusLine   ctermfg=#f6f3e8 ctermbg=#444444
" hi StatusLineNC ctermfg=#857b6f ctermbg=#444444
" hi SpecialKey   ctermfg=#808080 ctermbg=#343434

" PYTHON specific
hi pythonDecorator ctermfg=210
hi pythonExClass   ctermfg=218 cterm=none
hi pythonArgs      ctermfg=123 cterm=none
hi pythonRun       ctermfg=251
hi link pythonBuiltinObj    Type
hi link pythonBuiltinFunc   Type
hi link pythonParamName     pythonArgs
hi link pythonSuperclass    pythonArgs
hi link pythonUniEscape     StringSpec
hi link pythonEscape        StringSpec
hi link pythonStrFormatting StringSpec

" RUBY specific
hi link rubyStringEscape           StringSpec
hi link rubyInterpolation          StringSpec
hi link rubyQuoteEscape            StringSpec
hi link rubyInterpolationDelimiter StringSpec

" DIFF specific
hi diffAdded   ctermfg=42
hi diffRemoved ctermfg=208

" links
hi link Define   Entity
hi link Function Entity

hi link Structure Support
hi link Test      Support

hi link Character Constant
hi link Number    Constant
hi link Boolean   Constant

hi link Float Number

hi link Conditional  Statement
hi link StorageClass Statement
hi link Operator     Statement
hi link Statement    statement
