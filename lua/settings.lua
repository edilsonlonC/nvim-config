require'lspconfig'.eslint.setup{

	on_attach = function(client, bufnr)
		if client.server_capabilities.document_formatting then
			client.server_capabilities.document_formatting = true
		end
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        -- Mapeos de teclas para facilitar la navegación
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
	end,
	filetypes = {'typescript', 'javascript'},
	root_dir = require('lspconfig').util.root_pattern('eslint.config.mjs', 'tsconfig.json'),
	settings = {
		validate = "on",
		packageManager = "npm"
	}
}

require('lspconfig').ts_ls.setup({})

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

local dap = require('dap')
require('dapui').setup({
    layouts = {
        {
            elements = {
                { id = 'scopes', size = 0.25 }, -- Añade la sección de scopes
                { id = 'breakpoints', size = 0.25 },
                { id = 'stacks', size = 0.25 },
                { id = 'repl', size = 0.25 },
            },
            size = 40,
            position = 'left',
        },
    },
})



require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})



require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})


for _, language in ipairs({ "typescript" }) do
  require("dap").configurations[language] = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
		runtimeExecutable = "ts-node",
		args = { "-r", "dotenv/config", "${workspaceFolder}/src/index.ts"},
		sourceMaps = true,
		skipFiles = { 'node_modules/**', 'dist/**' },
    cwd = "${workspaceFolder}",
		protocol = "inspector"
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    processId = require'dap.utils'.pick_process,
    cwd = "${workspaceFolder}/src",
  }
}
end
