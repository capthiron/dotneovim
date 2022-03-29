local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    highlight = {
        enable = true
    },
	ensure_installed = {
		"bash",
		"c",
		"dockerfile",
		"fish",
		"go",
		"html",
		"java",
		"json",
		"lua",
		"python",
		"scss",
		"svelte",
		"tsx",
		"vim",
		"yaml",
	},
}
