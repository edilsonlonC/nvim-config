local lspconfig  = require('lspconfig')



local mason_registry = require('mason-registry')
--lspconfig.jdtls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.yamlls.setup({
settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/kubernetes"] = "k8s/*.yaml", -- Kubernetes
        ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*", -- GitHub Actions
        -- Agregar más esquemas si es necesario
      },
      validate = true,  -- Habilitar validación
      hover = true,     -- Habilitar información al pasar el ratón
      completion = true,  -- Habilitar autocompletado
    }
  }
})


