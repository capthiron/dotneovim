local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    highlight = {
        enable = true
    },
	ensure_installed = {
		"astro",
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
		"rust",
		"scss",
		"svelte",
		"terraform",
		"tsx",
		"vim",
		"yaml",
	},
}
