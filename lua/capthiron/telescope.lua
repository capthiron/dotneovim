local telescope = require('telescope')

telescope.setup {
	defaults = {
		layout_strategy = 'flex',
		layout_config = {
			prompt_position = 'top'
		},
		sorting_strategy = 'ascending',
		file_ignore_patterns = {
			"node_modules",
			"plugged",
			"target"
		}
	}
}

-- load fzf
telescope.load_extension('fzf')
