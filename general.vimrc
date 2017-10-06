silent function! OSX()
  return has('macunix')
endfunction
silent function! LINUX()
  return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
  return  (has('win32') || has('win64'))
endfunction

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
    " Automatically enable mouse
    set mouse=a
    " Hide the mouse cursor while typing
    set mousehide
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

" Assume a dark background
set background=dark

" No beeps
set noerrorbells

set expandtab    " tabs are spaces, not tabs
set shiftwidth=2 " use two-character soft tabs for indentation
set smartindent
set tabstop=4    " indent every four columns

" Hint - use EasyAlign command vipga"

set number                                         " show line numbers
set nowrap                                         " don't wrap long lines
set scrolloff=2
set ruler                                          " show the cursor position all the time
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set cursorline
set title
set showmode                                       " show mode if we don't have airline
set showcmd                                        " show me what i'm typing
set showtabline=2                                  " always show tabline

set noswapfile                                     " don't use swapfile
set nobackup                                       " don't create annoying backup files
set nowritebackup

set hidden                                         " allow hidden buffers, don't limit to 1 file per window/split
set confirm                                        " Ask to save buffer instead of failing when executing
                                                   " commands which close buffers
set autowrite                                      " automatically save before :next, :make etc.
set lazyredraw                                     " wait to redraw

set showmatch
set matchtime=2
set noshowmatch                                    " do not show matching brackets by flickering
set ignorecase                                     " search case insensitive...
set smartcase                                      " ... but not when search pattern contains upper case characters
set magic                                          " for regex

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

" more natural splits
set splitbelow
set splitright

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

if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  elseif has('unix') && has('clipboard') " neovim has('unnamedplus') is always 0
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot
set wildignore+=*/.git/*

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
    " Don't produce error for attempting to save a buffer w/out a file name.
	autocmd FocusLost * :silent! wa

    " Add spellcheck to gitcommit
	autocmd FileType gitcommit setlocal spell
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    autocmd BufNewFile,BufRead haproxy.cfg set filetype=haproxy

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

  " use tabs
   augroup Golang
    au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
  augroup END

  augroup Markdown
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80 formatoptions+=t
  augroup END

endif " has("autocmd")

" Use ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

