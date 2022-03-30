vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
	a_last_session = {
		description = {' Open last session                     SPC s l'},
		command = 'SessionLoad',
	},
	b_find_file = {
		description = {' Find file                             SPC f f'},
		command = 'DashboardFindFile',
	},
	c_find_word = {
		description = {' Find word                             SPC f g'},
		command = 'Telescope live_grep',
	},
	d_change_colorscheme = {
		description = {' Change theme                                 '},
		command = 'DashboardChangeColorscheme',
	},
}

vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_pipeline = 'lolcat'
vim.g.dashboard_preview_file = '~/.config/nvim/neovim.cat'
vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file_width = 80
