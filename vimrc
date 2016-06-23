
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

