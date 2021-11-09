compiler go
nnoremap <buffer> <space> :silent make <bar> redraw!<CR>
nnoremap <buffer> <F7> :terminal go run %<CR>
set termwinsize=10x0

set shiftwidth=2
set tabstop=2
set softtabstop=2
set noexpandtab
set autoindent
set smartindent

" User-defined command for running gofmt on select lines (default all)
:command! -buffer -range=% Gofmt let b:winview = winsaveview() |
  \ silent! execute <line1> . "," . <line2> . "!gofmt " | 
  \ call winrestview(b:winview)

" User-defined command for running goimport on select lines (default all)
:command! -buffer -range=% Goimport let b:winview = winsaveview() |
  \ silent! execute <line1> . "," . <line2> . "!goimports " | 
  \ call winrestview(b:winview)

" Autocommand for running gofmt and goimport on buffer saves
augroup Goupdate
  autocmd!
  autocmd BufWritePre <buffer> Gofmt
augroup END


" Better Highlighting
syntax match goCustomParen     "(" contains=cParen
syntax match goCustomFuncDef   "func\s\+\w\+\s*(" contains=goDeclaration,goCustomParen
" Exclude import as function name, for multi-line imports
syntax match goCustomFunc      "import\s\+(\|\(\w\+\s*\)(" contains=goCustomParen,goImport
syntax match goCustomScope     "\."
syntax match goCustomAttribute "\.\w\+" contains=goCustomScope
syntax match goCustomMethod    "\.\w\+\s*(" contains=goCustomScope,goCustomParen

highlight def link goCustomMethod Function
highlight def link goCustomAttribute Identifier

highlight goCustomFuncDef ctermfg=13
highlight goCustomFunc ctermfg=43
highlight goCustomAttribute ctermfg=247
highlight goCustomMethod ctermfg=33
