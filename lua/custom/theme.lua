-- Applies the theme family chosen with the `theme` script (~/.local/bin/theme),
-- which also switches Ghostty and opencode. The family is read from
-- $XDG_STATE_HOME/theme/current at startup, and the state directory is watched
-- so every running Neovim switches when the script runs elsewhere.
local M = {}

M.families = { 'tokyonight', 'catppuccin', 'rose-pine', 'kanagawa' }

local colorschemes = {
  tokyonight = 'tokyonight-storm',
  catppuccin = 'catppuccin-mocha',
  ['rose-pine'] = 'rose-pine-main',
  kanagawa = 'kanagawa-wave',
}

local state_dir = (vim.env.XDG_STATE_HOME or (vim.env.HOME .. '/.local/state')) .. '/theme'
local state_file = state_dir .. '/current'

local function current_family()
  local ok, lines = pcall(vim.fn.readfile, state_file)
  local family = ok and lines[1] or nil
  return colorschemes[family] and family or 'tokyonight'
end

function M.apply()
  local colorscheme = colorschemes[current_family()]
  if vim.g.colors_name ~= colorscheme then
    vim.cmd.colorscheme(colorscheme)
  end
end

function M.pick()
  local current = current_family()
  vim.ui.select(M.families, {
    prompt = 'Theme',
    format_item = function(family)
      return (family == current and '* ' or '  ') .. family
    end,
  }, function(family)
    if not family then
      return
    end
    vim.system({ 'theme', family }, { text = true }, function(result)
      if result.code ~= 0 then
        vim.schedule(function()
          vim.notify(result.stderr, vim.log.levels.ERROR)
        end)
      end
    end)
  end)
end

function M.setup()
  M.apply()

  -- The script replaces the file with a rename, which would end a watch on
  -- the file itself, so the directory is watched instead.
  vim.fn.mkdir(state_dir, 'p')
  local watcher = vim.uv.new_fs_event()
  if watcher then
    watcher:start(state_dir, {}, function(err, filename)
      if not err and filename == 'current' then
        vim.schedule(M.apply)
      end
    end)
  end

  vim.keymap.set('n', '<leader>tc', M.pick, { desc = '[T]oggle [c]olorscheme family' })
end

return M
