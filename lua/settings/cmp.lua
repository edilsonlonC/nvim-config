-- Configuración de nvim-cmp
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      -- Usa cualquier motor de snippets que prefieras, aquí se usa luasnip
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<CR>']  = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    { name = 'nvim_lsp' },         -- Fuente LSP
    { name = 'buffer' },           -- Fuente basada en el buffer
    { name = 'path' },             -- Fuente basada en el sistema de archivos
    { name = 'cmdline' },          -- Fuente para la línea de comandos
  },
})

