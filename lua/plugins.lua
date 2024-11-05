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
	use "leoluz/nvim-dap-go"
	use {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
	--keymaps = {
    --accept_suggestion = "<Tab>",
    --clear_suggestion = "<C-]>",
    --accept_word = "<C-j>",
  --},
  --color = {
    --suggestion_color = "#ffffff",
    --cterm = 244,
  --},
  --log_level = "debug", -- set to "off" to disable logging completely
  --disable_keymaps = false, -- disables built in keymaps for more manual control
	--disable_inline_completion = false,
  --condition = function()
    --return false
  --end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
})
  end,
	}
	use 'terryma/vim-multiple-cursors'	
	use {
  "microsoft/vscode-js-debug",
  opt = true,
  run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
}
	use 'preservim/nerdcommenter'
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
	use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {'nvim-java/nvim-java', requires = {
    'nvim-java/lua-async-await',
		'nvim-java/nvim-java-refactor',
		'nvim-java/nvim-java-core',
		'nvim-java/nvim-java-test',
		'nvim-java/nvim-java-dap',
		'MunifTanjim/nui.nvim',
		'neovim/nvim-lspconfig',
		'mfussenegger/nvim-dap'
}}
	 use 'JavaHello/spring-boot.nvim'

end)
