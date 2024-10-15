return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'scrooloose/nerdtree'
	use { 'junegunn/fzf', run = './install --bin' } 
	use 'junegunn/fzf.vim'
	use 'jiangmiao/auto-pairs'
	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'ryanoasis/vim-devicons'
	use 'vimlab/split-term.vim'
	use 'navarasu/onedark.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
	use 'terryma/vim-multiple-cursors'	
	use {
  "microsoft/vscode-js-debug",
  opt = true,
  run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
}
	--use 'mfussenegger/nvim-dap'
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
	use 'rcarriga/nvim-dap-ui'
	use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }

}
end)
