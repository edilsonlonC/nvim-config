local builtin = require('telescope.builtin')
vim.g.mapleader = " "
vim.cmd('map <F2> :NERDTreeToggle <CR>')
-- moving into tabs
vim.cmd([[
map  <A-c> 1<leader>c<space>
map <S-;> :vertical resize +10<CR>
map <S-l> <C-w><Right>
map <S-h> <C-w><Left>
map <S-k> <C-w><Up>
map <S-j> <C-w><Down>
map  <C-c> 1<leader>c<space>
]])

-- Fzf finder
--vim.keymap.set('n', '<leader>ff', ':Files<CR>', { noremap = true })

-- telescope finder
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>do', function() require('dapui').open() end)
vim.keymap.set('n', '<leader>dc', function() require('dapui').close() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F8>', function() require('dap').terminate() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
--vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true, noremap = true})
--vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true, noremap = true})
--vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {silent = true, noremap = true})
--vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>vs', ":vsplit<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>hs', ":split<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- java
vim.keymap.set('n', '<leader>ii', '<Cmd>lua vim.lsp.buf.code_action()<CR>' )
-- neo-tree
vim.keymap.set('n', '<leader>nf', ':Neotree<CR>')
vim.keymap.set('n', '<leader>bn', ':bn<CR>')
vim.keymap.set('n', '<leader>bd', ':bd<CR>')

--vim.cmd([[
--autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
--autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
--autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
--autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
--]])






