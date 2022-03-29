local telescope = require('telescope')

telescope.setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"plugged",
			"target"
		}
	}
}

-- load fzf
telescope.load_extension('fzf')
