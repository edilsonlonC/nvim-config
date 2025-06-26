require('telescope').setup({
	defaults = {
		file_ignore_patterns = { "node_modules/.*", "dist", "%.class$", "target" },
		prompt_prefix = "  ",
		mappings = {
			i = {                                                           -- Mappings en el modo de inserción
				-- Cambiar las teclas de navegación
				["<C-j>"] = require('telescope.actions').move_selection_next, -- Mover hacia abajo
				["<C-k>"] = require('telescope.actions').move_selection_previous, -- Mover hacia arriba

				-- Cambiar la tecla de selección
				["<CR>"] = require('telescope.actions').select_default,       -- Seleccionar item
				["<C-x>"] = require('telescope.actions').select_horizontal,   -- Selección horizontal
				["<C-v>"] = require('telescope.actions').select_vertical,     -- Selección vertical
				["<C-c>"] = require('telescope.actions').close,               -- Cerrar Telescope
			},
			n = {                                                           -- Mappings en el modo normal
				["<C-j>"] = require('telescope.actions').move_selection_next, -- Mover hacia abajo
				["<C-k>"] = require('telescope.actions').move_selection_previous, -- Mover hacia arriba
				["<CR>"] = require('telescope.actions').select_default,       -- Seleccionar item
				["<C-c>"] = require('telescope.actions').close,               -- Cerrar Telescope
			}
		}
	}
})
