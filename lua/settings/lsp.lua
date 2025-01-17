local lspconfig  = require('lspconfig')



local mason_registry = require('mason-registry')
--lspconfig.jdtls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.gopls.setup({})



