vim.cmd([[
if (has("termguicolors"))
	set termguicolors
endif
set title "show name file in terminal
set relativenumber
set mouse=a

set cursorline
set colorcolumn=120
set number 
set showcmd
"identar
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set noshowmode
set conceallevel=0
"terminal conf
set splitbelow
set splitright
set clipboard=unnamedplus
 " trigger `autoread` when files changes on disk
set autoread
"set guifont=Hack Nerd Font Mono-Regular:h11
set encoding=UTF-8
set lazyredraw    " Evita redibujar la pantalla innecesariamente
set noswapfile    " Desactiva los archivos swap
set noundofile    " Desactiva el archivo de deshacer
set clipboard+=unnamedplus
set nowrap
]])

--vim.cmd([[
--colorscheme github_dark_high_contrast 
--]])
--
vim.cmd([[
set termguicolors
]])
vim.opt.termguicolors = true
vim.cmd([[

colorscheme cyberdream 

]])
--require('onedark').setup {
	--style = 'deep',
	--theme = 'onedark',
	--transparent = false,
	--term_colors = true,

--}
--require('onedark').load()
vim.opt.guifont = "DroidSansMNerdFont Mono:h12"

vim.cmd [[ 
 
	autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.format()

]] 

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = {"*"},
  callback = function()
    vim.cmd("cwindow")
  end,
})
