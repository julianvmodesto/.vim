" CONFIGURED FOR NEOVIM
" plugins expect bash - not fish, zsh, etc
set shell=bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" Show trailing whitespace
Plugin 'bronson/vim-trailing-whitespace'
" use tab for auto completion
Plugin 'ervandew/supertab'
" smart auto indenting`
Plugin 'godlygeek/tabular'
" t comment for block comments
Plugin 'neomake/neomake'
Plugin 'tomtom/tcomment_vim'
" Ctrl+P
Plugin 'kien/ctrlp.vim'
" Show git +/- in gutter
Plugin 'airblade/vim-gitgutter'
" Show vim marks in gutter
Plugin 'kshenoy/vim-signature'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""

" two-character soft tabs for indentation
set expandtab
set tabstop=8
set shiftwidth=2
set smartindent

" show color column for 80-char limit
execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=238
highlight ColorColumn guibg=Black

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Display settings
set nowrap
set scrolloff=2
set showmatch
set showmode
set showcmd
set ruler
set title
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set matchtime=2

" Editor settings
set ignorecase
set smartcase
set magic
set bs=indent,eol,start

" System settings
set confirm
set hidden

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_go_enabled_makers = ['golint', 'govet']

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_list_type = "quickfix"

"we also want to get rid of accidental trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" use macOS clipboard
set clipboard=unnamed

autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

