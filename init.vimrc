" plugins expect bash -, not fish, nor zsh, etc.
set shell=bash

" Begin vim-plug
call plug#begin()

Plug 'neomake/neomake'

Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'

Plug 'kien/ctrlp.vim'

Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'

Plug 'christoomey/vim-tmux-navigator'

" Go
Plug 'fatih/vim-go'

" Add plugins to &runtimepath
call plug#end()

" vim-plug Help
" :PlugInstall	install plugins
" :PlugUpdate	update plugins
" :PlugClean	remove unused plugins
" :PlugUpgrade	upgrade vim-plug
"
" :w            write file
" :source %     source file

