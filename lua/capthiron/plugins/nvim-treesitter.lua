return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
					"astro",
					"bash",
					"c",
					"css",
					"dockerfile",
					"fish",
					"gitignore",
					"go",
					"graphql",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"rust",
					"scss",
					"svelte",
					"terraform",
					"vim",
					"yaml",
				},
				-- auto install above language parsers
				auto_install = true,
			})
		end,
	},
}
