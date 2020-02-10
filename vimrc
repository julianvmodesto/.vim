""" Install Plugins
let g:python_host_prog = $HOME.'~/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'

if ! has('python') && ! has('python3')
  echo 'Expected to find python + python3, but either or both were not found'
end

" plugins expect bash -, not fish, nor zsh, etc.
set shell=bash

" Begin vim-plug
call plug#begin()

Plug 'neomake/neomake'

Plug 'ervandew/supertab'                 " autocomplete with tabs
Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggle between relative + absolute line numbers with :set number (no)relativenumber
Plug 'bronson/vim-trailing-whitespace'   " delete trailing whitespace
Plug 'tomtom/tcomment_vim'               " toggle comments
Plug 'junegunn/vim-easy-align'           " align text
Plug 'AndrewRadev/splitjoin.vim'         " toggle blocks between multiple line blocks + one-liners
Plug 'jiangmiao/auto-pairs'              " insert + delete pairs of brackets, quotes, parens, etc.
Plug 'tpope/vim-surround'
Plug 'wincent/terminus'
Plug 'tpope/vim-abolish'                 " case-sensitive text substitution

Plug 'kien/ctrlp.vim'                    " fuzzy file finder
Plug 'christoomey/vim-tmux-navigator'    " navigate between tmux + vim panes
Plug 'tmux-plugins/vim-tmux'

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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Scala
Plug 'derekwyatt/vim-scala'

" JavaScript
Plug 'jaawerth/nrun.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Markdown
Plug 'mzlogin/vim-markdown-toc'
" |npm install -g livedown| or |yarn global add livedown|
if executable('livedown')
  Plug 'shime/vim-livedown'
endif

" Terraform
Plug 'hashivim/vim-terraform'

" Jsonnet
Plug 'google/vim-jsonnet'

" HAProxy
Plug 'vim-scripts/haproxy'

" Caddy
Plug 'isobit/vim-caddyfile'

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

""" General

silent function! OSX()
  return has('macunix')
endfunction
silent function! LINUX()
  return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
  return (has('win32') || has('win64'))
endfunction

if !has('nvim')
  " Syntax highlighting
  syntax on
  syntax enable

  set nocompatible
  filetype off

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

  if &tabpagemax < 50
    set tabpagemax=50
  endif

  if !empty(&viminfo)
    set viminfo^=!
  endif

endif

" Incremental preview of search & replace
if exists('&inccommand')
  set inccommand=nosplit
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  " Automatically enable mouse
  set mouse=a
  " Hide the mouse cursor while typing
  set mousehide
endif

" Assume a dark background
set background=dark

" No beeps
set noerrorbells

set expandtab    " tabs are spaces, not tabs
set shiftwidth=2 " use two-character soft tabs for indentation
set tabstop=4    " indent every four columns
set softtabstop=2

filetype plugin indent on
set autoindent

" Hint - use EasyAlign command vipga"

set number                                         " show line numbers
set nowrap                                         " don't wrap long lines
set scrolloff=2
set fileformats=unix,dos,mac                       " Prefer Unix over Windows over OS 9 formats
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
set synmaxcol=150
set re=1

" do not hide markdown
set conceallevel=0

" time out on key codes but not mappings.
" basically this makes terminal vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" better completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" Faster update time
set updatetime=400

" show color column for 80-char limit
execute "set colorcolumn=" . join(range(81,335), ',')
augroup Highlights
  autocmd!
  highlight colorcolumn ctermbg=238
  highlight colorcolumn guibg=black
augroup END

if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  elseif has('unix') && has('clipboard') " neovim has('unnamedplus') is always 0
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full

set wildignore+=.hg,.git,.svn                        " Version control
set wildignore+=*.aux,*.out,*.toc                    " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest     " compiled object files
set wildignore+=*.spl                                " compiled spelling word lists
set wildignore+=*.sw?                                " Vim swap files
set wildignore+=*.DS_Store                           " OSX bullshit
set wildignore+=*.luac                               " Lua byte code
set wildignore+=migrations                           " Django migrations
set wildignore+=go/pkg                               " Go static files
set wildignore+=go/bin                               " Go bin files
set wildignore+=go/bin-vagrant                       " Go bin-vagrant files
set wildignore+=*.py[co]                             " Python byte code
set wildignore+=*.orig                               " Merge resolution files
set wildignore+=*.bak,*~,*.swp
set wildignore+=*/tmp/*,*.so,*.zip,*.gzip
set wildignore+=*node_modules*,*.ttf,*.woff,*.woff3,*.eot
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
    autocmd!

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
    autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

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
    autocmd!
    autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
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

" https://kartowicz.com/dryobates/2014-05/sorting_paragraphs_in_vim/
function! SortParagraphs() range
  execute a:firstline . "," . a:lastline . 'd'
  let @@=join(sort(split(substitute(@@, "\n*$", "", ""), "\n\n")), "\n\n")
  put!
endfunction

""" Plugin Config

let g:neomake_go_enabled_makers = ['golint', 'govet']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_shellcheck_args = ['-fgcc']

" When switching/opening a JS buffer, set neomake's eslint path, and enable it as a maker
augroup NeomakeJS
  autocmd!
  autocmd BufEnter *.js let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
augroup END

" Run Neomake on current file on write
"
if exists(':Neomake')
  augroup Neomake
    autocmd!
    autocmd! BufWritePost,BufEnter * Neomake
  augroup END
endif

let g:terraform_fmt_on_save = 1

let g:jsx_ext_required = 0

" Make CtrlP faster by ignoring files in .gitignore
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" Use ripgrep for ctrlp
if executable('rg')
  "  --files: List files that would be searched but do not search
  "  --hidden: Search hidden files and folders
  "  --follow: Follow symlinks
  "  --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  let g:ctrlp_user_command = 'rg %s --files --color=never --hidden --follow --glob "!.git/*"'
  let g:ctrlp_use_caching = 0
endif

let g:go_fmt_command = 'goimports'
let g:go_rename_command = 'gopls'

" turn highlighting on
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1

let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1

" :GoAlternate
augroup GoAlternate
  autocmd!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" :GoInfo
let g:go_auto_type_info = 1

let g:go_auto_sameids = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Don't auto-pair  " because it's a vim comment
augroup NoAutoPairVimComments
  autocmd!
  autocmd Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'}
augroup END

" :RustFmt
let g:rustfmt_autosave = 1

" mzlogin/vim-markdown-toc
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
let g:vmt_fence_hidden_markdown_style = 'GFM'

""" Line
set noshowmode " We show the mode with airline or lightline

" Airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'


""" Keys

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

noremap j gj
noremap k gk

" set moving between windows to ctrl+arrows
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" set moving between windows to ctrl+hjkl
noremap <silent> <C-l> <c-w>l
noremap <silent> <C-h> <c-w>h
noremap <silent> <C-k> <c-w>k
noremap <silent> <C-j> <c-w>j

" Act like D and C
nnoremap Y y$

" sometimes this happens and I hate it
noremap :Vs :vs
noremap :Sp :sp
noremap :Q :q
noremap :W :w
noremap :Wq :wq

" Do not show stupid q: window
" https://twitter.com/ingridmorstrad/status/904169399166296067
noremap q: :q

" Use Ctrl-C instead of Esc
noremap <c-c> <esc>

" Avoid <Esc>
inoremap jk <Esc>l

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Quick change directory to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Quickly jump between errors in quickfix
noremap <C-n> :cnext<CR>
noremap <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Center the screen
nnoremap <space> zz

" Move up and down on splitted lines (on small width screens)
map <Up> gk
map <Down> gj

" Close tabs to the right
noremap :qr ::.+1,$tabdo :q
" NOTE: use :tabonly to close all other tabs

" Go
augroup VimGo
  autocmd!
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go noremap <leader>b :<C-u>call <SID>build_go_files()<CR>
augroup END

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files() abort
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

augroup MarkdownTableFormat
  autocmd!
  au FileType markdown vmap <tab> :EasyAlign*<Bar><Enter>
augroup END

