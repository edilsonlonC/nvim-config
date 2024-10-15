map <f2> :NERDTreeToggle<CR>

"map <C-l> :tabn <CR>
map <C-l> :bn <CR>
map <A-e> :q <CR>
map <A-s> :w <CR>
map <A-f> :Files <CR>
map <A-g> :GFiles <CR>
map <A-t> :Term <CR>
map <A-l> <C-w><Right>
map <A-h> <C-w><Left>
map <A-k> <C-w><Up>
map <A-j> <C-w><Down>
map <A-u> <Esc>
map <S-l> :vsplit <CR>
map <A-r> :NERDTreeRefreshRoot <CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map! <A-CR> <Right>
nnoremap <leader> :call CocAction('runCommand', 'typescript.addMissingMethods')<CR>
"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug> (coc-implementation)
nmap <silent> gr <Plug> (coc-references)
map  <A-c> 1<leader>c<space>
map <A-;> :vertical resize +10<CR>
map <A-/> :vertical resize -10<CR>
map <S-f> :ALEFix<CR>
"imap <S-f> :Ag <CR>
set encoding=UTF-8


" syntax enable
