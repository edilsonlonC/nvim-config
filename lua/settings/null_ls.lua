
local null_ls = require("null-ls")

null_ls.setup({
  sources = {

		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.gofumpt,

    -- Prettier para formateo
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "javascript", "typescript", "typescriptreact", "json", "yaml", "markdown" },
    }),

    -- ESLint diagnósticos y acciones de código (fixes)
    --null_ls.builtins.diagnostics.eslint_d,
    --null_ls.builtins.code_actions.eslint_d,
    -- null_ls.builtins.formatting.eslint_d, -- si querés que eslint formatee en lugar de Prettier
		--null_ls.builtins.diagnostics.golangci_lint,
		--null_ls.builtins.formatting.goimports,
		--null_ls.builtins.formatting.gofumpt,
    --null_ls.builtins.formatting.goimports_reviser,
    --null_ls.builtins.formatting.golines,

  },

  -- Auto formateo al guardar
	--on_attach = function(client, bufnr)
		--if client.supports_method("textDocument/formatting") then
			--vim.api.nvim_create_autocmd("BufWritePre", {
				--group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
				--buffer = bufnr,
				--callback = function()
					--vim.lsp.buf.format()
				--end,
			--})
		--end
	--end,
	
 on_attach = function(client, bufnr)
	 print('on_attach')
    if client.supports_method("textDocument/formatting") then
			print('supports_method')
      vim.api.nvim_clear_autocmds({
        --group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        --group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})



