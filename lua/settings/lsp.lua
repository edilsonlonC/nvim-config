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
		validate = "off",
		packageManager = "npm"
	}
}
require('lspconfig').ts_ls.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').jdtls.setup({
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
						default = true,
					}
				}
			}
		}
	}
})
