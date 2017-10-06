" plugins expect bash -, not fish, nor zsh, etc.
set shell=bash

" Begin vim-plug
call plug#begin()

Plug 'neomake/neomake'

Plug 'ervandew/supertab'                 " autocomplete with tabs
Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggle between relative + absolute line numbers
Plug 'bronson/vim-trailing-whitespace'   " delete trailing whitespace
Plug 'tomtom/tcomment_vim'               " toggle comments
Plug 'junegunn/vim-easy-align'           " align text
Plug 'AndrewRadev/splitjoin.vim'         " toggle blocks between multiple line blocks + one-liners
Plug 'jiangmiao/auto-pairs'              " insert + delete pairs of brackets, quotes, parens, etc.

Plug 'kien/ctrlp.vim'                    " fuzzy file finder
Plug 'christoomey/vim-tmux-navigator'    " navigate between tmux + vim panes

Plug 'vim-airline/vim-airline'           " fancy status line
Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature'             " display marks in gutter
Plug 'airblade/vim-gitgutter'            " display Git changes in gutter

Plug 'tpope/vim-fugitive'                " Git workflow funcs

if has('python3') && has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

Plug 'SirVer/ultisnips'                  " enable snippets engine
Plug 'honza/vim-snippets'                " enable snippets

Plug 'editorconfig/editorconfig-vim'     " adhere to .editorconfig
Plug 'wakatime/vim-wakatime'             " Wakatime tracking

" Rust
Plug 'rust-lang/rust.vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Scala
Plug 'derekwyatt/vim-scala'

" JavaScript
Plug 'jaawerth/nrun.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Markdown
" if has('nvim') && executable('npm')
"   Plug 'neovim/node-host', { 'do': 'npm install' }
"   Plug 'vimlab/mdown.vim', { 'do': 'npm install' }
" endif

" Terraform
Plug 'hashivim/vim-terraform'

" Jsonnet
Plug 'google/vim-jsonnet'

" HAProxy
Plug 'vim-scripts/haproxy'

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

