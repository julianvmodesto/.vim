
if !has('nvim')
  " Syntax highlighting
  syntax on
  syntax enable

  filetype off
  filetype plugin indent on

  set nocompatible

  set autoindent

  set autoread " Automatically reread changed files without asking me anything

  " Allow backspacing over everything in insert mode
  set backspace=indent,eol,start

  set complete-=i

  set display+=lastline

  set encoding=utf-8 " Set default encoding to UTF-8

  set hlsearch    " Highlight found searches
  set incsearch   " Shows the match while typing

  set nrformats-=octal

  set smarttab

  set ttyfast

  " In many terminal emulators the mouse works just fine, thus enable it.
  if has('mouse')
    set mouse=a
  endif

  if &tabpagemax < 50
    set tabpagemax=50
  endif

  if !empty(&viminfo)
    set viminfo^=!
  endif

endif

if has('nvim')
endif

" No beeps
set noerrorbells

" Use two-character soft tabs for indentation
set expandtab
set shiftwidth=2
set smartindent
set tabstop=4

" Hint - use EasyAlign command vipga"

set number   " Show line numbers
set showcmd  " Show me what I'm typing
set showmode " Show current mode
set nowrap
set scrolloff=2
set ruler    " Show the cursor position all the time
set cursorline
set title

set noswapfile " Don't use swapfile
set nobackup   " Don't create annoying backup files
set nowritebackup

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
set confirm

set autowrite      " Automatically save before :next, :make etc.

set lazyredraw " Wait to redraw

set showmatch
set matchtime=2
set noshowmatch " Do not show matching brackets by flickering
set noshowmode  " We show the mode with airlien or lightline
set ignorecase  " Search case insensitive...
set smartcase   " ... but not when search pattern contains upper case characters
set magic       " For regex

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" show color column for 80-char limit
execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=238
highlight ColorColumn guibg=Black

" Use macOS clipboard
set clipboard=unnamed

set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

if &history < 1000
  set history=50
endif


if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

if has("autocmd")

  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=108

    " Trim whitespace onsave
    autocmd BufWritePre * %s/\s\+$//e

	autocmd FocusLost * :wa " Set vim to save the file on focus out.

    " open help vertically
    command! -nargs=* -complete=help Help vertical belowright help <args>
    autocmd FileType help wincmd L

    " Add spellcheck to gitcommit
	autocmd FileType gitcommit setlocal spell

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

endif " has("autocmd")

