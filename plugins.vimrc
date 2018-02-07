
let g:neomake_go_enabled_makers = ['golint', 'govet']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_sh_enabled_makers = ['shellcheck']

" When switching/opening a JS buffer, set neomake's eslint path, and enable it as a maker
augroup NeomakeJS
  autocmd!
  autocmd BufEnter *.js let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
augroup END

" Run Neomake on current file on write
augroup Neomake
  autocmd!
  autocmd! BufWritePost,BufEnter * Neomake
augroup END

let g:jsx_ext_required = 0

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

" :GoAlternate
augroup GoAlternate
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

" Don't auto-pair  " because it's a vim comment
augroup NoAutoPairVimComments
  autocmd Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'}
augroup END

" :RustFmt
let g:rustfmt_autosave = 1

