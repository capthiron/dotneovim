return {
	{
		"folke/tokyonight.nvim",
		priority = 1002,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
