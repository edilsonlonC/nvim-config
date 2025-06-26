local lspconfig  = require('lspconfig')


local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason-registry')
--lspconfig.jdtls.setup({})

lspconfig.ts_ls.setup({
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	capabilities = capabilities,
on_attach = function(client, bufnr)
    -- Dejá que null-ls se encargue del formato
    client.server_capabilities.documentFormattingProvider = false
  end

})
--lspconfig.gopls.setup({})
--
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = {
        command = "clippy"
      },
    }
  }
})

lspconfig.gopls.setup({
      cmd = {"gopls"},
      filetypes = {"go", "gomod"},
      root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
    })

lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.lemminx.setup({})
