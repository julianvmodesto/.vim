
if !has('nvim')
  " Syntax highlighting
  syntax on
  syntax enable

  filetype off
  filetype plugin indent on

  set nocompatible

  set autoindent

  set autoread                   " Automatically reread changed files without asking me anything

  set backspace=indent,eol,start " Allow backspacing over everything in insert mode

  set complete-=i

  set display+=lastline

  set encoding=utf-8             " Set default encoding to UTF-8

  set hlsearch                   " Highlight found searches
  set incsearch                  " Shows the match while typing

  set laststatus=2               " always show status line

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

set number        " show line numbers
set nowrap
set scrolloff=2
set ruler         " show the cursor position all the time
set cursorline
set title
set showmode      " show mode if we don't have airline
set showcmd       " show me what i'm typing
set showtabline=2 " always show tabline

set noswapfile    " don't use swapfile
set nobackup      " don't create annoying backup files
set nowritebackup

set hidden     " allow hidden buffers, don't limit to 1 file per window/split
set confirm    " Ask to save buffer instead of failing when executing
               " commands which close buffers
set autowrite  " automatically save before :next, :make etc.
set lazyredraw " wait to redraw

set showmatch
set matchtime=2
set noshowmatch   " do not show matching brackets by flickering
set ignorecase    " search case insensitive...
set smartcase     " ... but not when search pattern contains upper case characters
set magic         " for regex

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1

" time out on key codes but not mappings.
" basically this makes terminal vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" better completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" show color column for 80-char limit
execute "set colorcolumn=" . join(range(81,335), ',')
highlight colorcolumn ctermbg=238
highlight colorcolumn guibg=black

set clipboard=unnamed " Yank to the system clipboard by default

set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot

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

    " Set vim to save the file on focus out.
	autocmd FocusLost * :wa

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

