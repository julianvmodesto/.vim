" A minimal vimrc for new vim users to start with.
"
" Referenced here:
" http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
if &compatible
  set nocompatible              " be iMproved, required
endif

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
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
" t comment for block comments
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
" Ctrl+P
Plugin 'kien/ctrlp.vim'
" Show git +/- in gutter
Plugin 'airblade/vim-gitgutter'
" Show vim marks in gutter
Plugin 'kshenoy/vim-signature'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
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
set smarttab
set smartindent

" show color column for 80-char limit
execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=238
highlight ColorColumn guibg=Black

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

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
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2
set matchtime=2

" Editor settings
set ignorecase
set smartcase
set magic
set bs=indent,eol,start

" System settings
set confirm
set hidden
set history=50

" vim syntastic plugin recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:go_list_type = "quickfix"

"we also want to get rid of accidental trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" use macOS clipboard
set clipboard=unnamed

" show pattern match while typing
set incsearch
" highlight search
set hlsearch
