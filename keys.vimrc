nmap j gj
nmap k gk

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
inoremap jk <Esc>

" Quick change directory to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Quickly jump between errors in quickfix
noremap <C-n> :cnext<CR>
noremap <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Close tabs to the right
noremap :qr ::.+1,$tabdo :q
" NOTE: use :tabonly to close all other tabs

" Go
augroup VimGo
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

