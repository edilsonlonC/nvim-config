
require'nvim-treesitter.configs'.setup ({
  ensure_installed = {'typescript','java'},  -- Instalar todos los lenguajes soportados
  highlight = {
    enable = true,  -- Habilitar resaltado de sintaxis
    disable = {},   -- Aquí puedes especificar lenguajes a deshabilitar
  } 

});



-- Cambiar colores de los grupos de resaltado de Tree-sitter
vim.api.nvim_set_hl(0, 'TSKeyword',        { fg = '#FF79C6' })  -- Palabras clave (neón rosa)
vim.api.nvim_set_hl(0, 'TSFunction',       { fg = '#50FA7B' })  -- Funciones (neón verde)
vim.api.nvim_set_hl(0, 'TSVariable',       { fg = '#8BE9FE' })  -- Variables (cian)
vim.api.nvim_set_hl(0, 'TSString',         { fg = '#F1FA8C' })  -- Cadenas de texto (amarillo neón)
vim.api.nvim_set_hl(0, 'TSComment',        { fg = '#6272A4' })  -- Comentarios (azul suave)
vim.api.nvim_set_hl(0, 'TSNumber',         { fg = '#BD93F9' })  -- Números (lavanda)
vim.api.nvim_set_hl(0, 'TSClass',          { fg = '#FFB86C' })  -- Clases (amarillo anaranjado)
vim.api.nvim_set_hl(0, 'TSType',           { fg = '#F8F8F2' })  -- Tipos de datos (blanco suave)
vim.api.nvim_set_hl(0, 'TSConstructor',    { fg = '#FF5555' })  -- Constructores (rojo brillante)
vim.api.nvim_set_hl(0, 'TSMethod',         { fg = '#50FA7B' })  -- Métodos (verde neón)
vim.api.nvim_set_hl(0, 'TSEmphasis',      { fg = '#FF79C6', bold = true })  -- Énfasis (neón rosa en negrita)
vim.api.nvim_set_hl(0, 'TSOperator',       { fg = '#FFB86C' })  -- Operadores (amarillo)
