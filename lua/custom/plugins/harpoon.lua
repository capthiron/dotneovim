return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>hh", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
		keymap.set("n", "<leader>ht", '<cmd>lua require("harpoon.term").gotoTerminal(1)<cr>')

		keymap.set(
			"n",
			"<leader>hm",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		keymap.set(
			"n",
			"<leader>hc",
			"<cmd>lua require('harpoon.mark').clear_all()<cr>",
			{ desc = "Clear all harpoon markers" }
		)

		keymap.set(
			"n",
			"<leader>jj",
			"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
			{ desc = "Navigate to harpoon marked file in slot 1" }
		)
		keymap.set(
			"n",
			"<leader>kk",
			"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
			{ desc = "Navigate to harpoon marked file in slot 2" }
		)
		keymap.set(
			"n",
			"<leader>ll",
			"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
			{ desc = "Navigate to harpoon marked file in slot 3" }
		)
		keymap.set(
			"n",
			"<leader>;;",
			"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
			{ desc = "Navigate to harpoon marked file in slot 4" }
		)
	end,
}
