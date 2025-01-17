vim.cmd([[
if (has("termguicolors"))
	set termguicolors
endif
set title "show name file in terminal
set number
set mouse=a

set cursorline
set colorcolumn=120
set relativenumber
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
set guifont=HackNerdFontMono-Regular:h11
"set guifont=IsovkaNerdFontMono-Regular:h11
set encoding=UTF-8
set lazyredraw    " Evita redibujar la pantalla innecesariamente
set noswapfile    " Desactiva los archivos swap
set noundofile    " Desactiva el archivo de deshacer

]])

--vim.cmd([[
--colorscheme github_dark_high_contrast 
--]])

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
vim.cmd [[ 
 
	autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.format()

]] 

