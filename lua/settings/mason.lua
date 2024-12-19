local registries = {
	"github:nvim-java/mason-registry",
	"github:mason-org/mason-registry"
}
require("mason").setup({
	log_level = vim.log.levels.OFF,
		registries = registries,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
	ensure_installed = {
		'jdtls',
	},
})
