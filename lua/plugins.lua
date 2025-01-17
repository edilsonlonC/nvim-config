return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'scrooloose/nerdtree'
	use { 'junegunn/fzf', run = './install --bin' } 
	use 'junegunn/fzf.vim'
	use 'jiangmiao/auto-pairs'
	use 'vimlab/split-term.vim'
	use 'navarasu/onedark.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim' 
	use 'nvim-tree/nvim-web-devicons'
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
	use 'tpope/vim-fugitive'
	use 'terryma/vim-multiple-cursors'	
	use {
  "microsoft/vscode-js-debug",
  opt = true,
  run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
}
	use 'preservim/nerdcommenter'
	use "nvim-lua/plenary.nvim"
	use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
}
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
	use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} , {'mfussenegger/nvim-dap'}}
}


		use 'mfussenegger/nvim-jdtls'
	 --use 'JavaHello/spring-boot.nvim'
	use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
 use 'stevearc/oil.nvim' 
 use { "scottmckendry/cyberdream.nvim" }
 use 'nvim-telescope/telescope-fzf-native.nvim'
 use { 'echasnovski/mini.nvim', version = '*' }
 use ({ 'projekt0n/github-nvim-theme' })
 use { 'craftzdog/solarized-osaka.nvim'	 }
 use { 'nvim-treesitter/nvim-treesitter' }
use {
    "williamboman/mason-lspconfig.nvim"}
use { "neovim/nvim-lspconfig" }
  use 'hrsh7th/nvim-cmp'                -- nvim-cmp, autocompletado
  use 'hrsh7th/cmp-nvim-lsp'            -- Soporte LSP para nvim-cmp
  use 'hrsh7th/cmp-buffer'              -- Completado basado en el buffer
  use 'hrsh7th/cmp-path'                -- Completado basado en el sistema de archivos
  use 'hrsh7th/cmp-cmdline'             -- Completado en la línea de comandos
  
  -- LSP y Java
  use 'neovim/nvim-lspconfig'           -- Configuración de LSP
use {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
  })  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}
use {
		"elmcgill/springboot-nvim",
		requires = {
				"neovim/nvim-lspconfig",
				"mfussenegger/nvim-jdtls",
				"nvim-tree/nvim-tree.lua",
		},
		config = function()
				local springboot_nvim = require("springboot-nvim")
				vim.keymap.set('n', '<leader>jr', springboot_nvim.boot_run, {desc = "Spring Boot Run Project"})
				vim.keymap.set('n', '<leader>jc', springboot_nvim.generate_class, {desc = "Java Create Class"})
				vim.keymap.set('n', '<leader>ji', springboot_nvim.generate_interface, {desc = "Java Create Interface"})
				vim.keymap.set('n', '<leader>Je', springboot_nvim.generate_enum, {desc = "Java Create Enum"})
				springboot_nvim.setup({})
		end
}
use({
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
})
end)
