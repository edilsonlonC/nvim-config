vim.g.split_terminal_default_shell = 'zsh'
vim.g.coc_node_path = '/Users/edilson.londono/.nvm/versions/node/v20.17.0/bin/node'
vim.g.coc_global_extensions = { 'coc-tsserver', 'coc-prettier', 'coc-git', 'coc-json', 'coc-java' }
vim.cmd([[
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
]])
vim.cmd([[
let g:airline_powerline_fonts = 1
]])

vim.cmd([[
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
]])

--vim.g.ale_linters = { javascript =  {'eslint'}, typescript = {'eslint', 'tsserver'} }
--vim.g.ale_fixers = {"eslint"}
--vim.g.ale_sign_error = "🐛"
--vim.g.ale_sign_warning = '⚠️'
--vim.g.ale_fix_on_save = 1
--vim.g.ale_completion_enabled = 1

