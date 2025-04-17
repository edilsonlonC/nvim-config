local lspconfig  = require('lspconfig')



local mason_registry = require('mason-registry')
--lspconfig.jdtls.setup({})

lspconfig.ts_ls.setup({
on_attach = function(client, bufnr)
    -- Dejá que null-ls se encargue del formato
    client.server_capabilities.documentFormattingProvider = false
  end

})
--lspconfig.gopls.setup({})
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
