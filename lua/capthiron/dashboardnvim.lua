local home = os.getenv('HOME')
local db = require('dashboard')
-- macos
db.preview_command = 'cat | lolcat -F 0.3'

db.preview_file_path = home .. '/.config/nvim/static/clepto.cat'
db.preview_file_height = 15
db.preview_file_width = 70
db.custom_center = {
  {icon = '⇀  ',
  desc = 'Harpoon Quick Menu                      ',
  action =  'lua require("harpoon.ui").toggle_quick_menu()',
  shortcut = 'SPC h h'},
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='File Browser                            ',
  action =  'Telescope file_browser',
  shortcut = 'SPC f b'},
  {icon = '  ',
  desc = 'Find  word                              ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f g'},
}

