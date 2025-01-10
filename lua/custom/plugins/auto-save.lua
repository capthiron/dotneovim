return {
  'pocco81/auto-save.nvim',
  config = function()
    local auto_save = require 'auto-save'

    auto_save.setup {
      write_all_buffers = true,
    }
  end,
}
