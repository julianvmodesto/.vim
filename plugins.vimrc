
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

