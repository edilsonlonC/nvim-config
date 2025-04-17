vim.cmd[[
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>
]]
