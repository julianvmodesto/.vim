" plugins expect bash -, not fish, nor zsh, etc.
set shell=bash

" Begin vim-plug
call plug#begin()

Plug 'neomake/neomake'

Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'

if has('python3') && has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kien/ctrlp.vim'

Plug 'kshenoy/vim-signature'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'christoomey/vim-tmux-navigator'

" Rust
Plug 'rust-lang/rust.vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" JavaScript
Plug 'jaawerth/nrun.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Markdown
if has('nvim')
  Plug 'neovim/node-host', { 'do': 'npm install' }
  Plug 'vimlab/mdown.vim', { 'do': 'npm install' }
endif

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
" :UpdateRemotePlugins

