local specs = {
	all = {
		syntax = {
			keyword = 'blue',
			conditional = 'magenta',
			number = 'orange'
		}
	}
}
require('github-theme').setup({
	specs = specs,
	options = {
		styles = {
			comments = 'italic',
			keywords = 'bold',
			functions = 'bold',
			strings = 'NONE',
			variables = 'NONE',
		},
	}
})
