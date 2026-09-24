-- A session saved while neo-tree was the only window records its buffer
-- ("neo-tree filesystem [1]") as a plain file. Restoring it creates a buffer
-- with that name, and neo-tree then fails with E95 when naming its own.
-- Wiping these before save and after restore keeps sessions clean and heals
-- sessions that already contain one; the VimEnter autocmd in neo-tree.lua
-- reopens the tree.
local function wipe_neotree_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf):match 'neo%-tree %a+ %[%d+%]$' then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Downloads', '/' },
    pre_save_cmds = { wipe_neotree_buffers },
    post_restore_cmds = { wipe_neotree_buffers },
    -- log_level = 'debug',
  },
}
