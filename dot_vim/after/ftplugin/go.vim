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

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc.vim
filetype plugin indent on
syntax on

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
