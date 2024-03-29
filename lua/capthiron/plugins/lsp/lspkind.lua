return {
	"onsails/lspkind.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspkind = require("lspkind")
		require("cmp").setup({
			formatting = {
				format = lspkind.cmp_format({
					--mode = 'symbol', -- show only symbol annotations
					with_text = true,
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

					-- The function below will be called before any actual modifications from lspkind
					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
					before = function(_, vim_item)
						-- ...
						return vim_item
					end,
				}),
			},
		})
	end,
}
