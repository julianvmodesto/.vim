
let g:neomake_go_enabled_makers = ['golint', 'govet']
let g:neomake_javascript_enabled_makers = ['eslint']

" When switching/opening a JS buffer, set neomake's eslint path, and enable it as a maker
autocmd BufEnter *.js let g:neomake_javascript_eslint_exe = nrun#Which('eslint')

" Run Neomake on current file on write
autocmd! BufWritePost * Neomake

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Make CtrlP faster by ignoring files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_list_type = "quickfix"

" Use deoplete.
let g:deoplete#enable_at_startup = 1

