-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local neotree_position = 'right'
local neotree_rtl = false

-- Characters that need mirroring for RTL tree guides
local rtl_char_map = {
  ['\226\148\148'] = '\226\148\152', -- └ → ┘
  ['\226\148\152'] = '\226\148\148', -- ┘ → └
}

--- Mirror directional characters in a string (preserves string order, only swaps specific chars)
local function mirror_chars(text)
  local result = text
  for original, mirrored in pairs(rtl_char_map) do
    result = result:gsub(original, mirrored)
  end
  return result
end

--- Reverse the order of NuiText segments in a NuiLine, mirror indent chars,
--- and right-align the result within the given width.
local function rtl_transform_line(line, win_width)
  if not line or not line._texts or #line._texts == 0 then
    return line
  end

  local NuiLine = require 'nui.line'

  -- Separate indent segments from content segments.
  -- Indent segments are at the start and consist only of whitespace and box-drawing chars.
  local indent_texts = {}
  local content_texts = {}
  local past_indent = false

  for _, ntext in ipairs(line._texts) do
    local txt = ntext:content()
    if not past_indent then
      -- Indent segments: only whitespace and box-drawing characters (U+2500-U+257F)
      -- and common expander icons (, , etc.)
      local is_indent = txt:match '^[%s\226\148\128-\226\149\191\239\128\128-\239\191\191]*$'
      if is_indent and #txt > 0 then
        table.insert(indent_texts, ntext)
      else
        past_indent = true
        table.insert(content_texts, ntext)
      end
    else
      table.insert(content_texts, ntext)
    end
  end

  -- Calculate total width of content and indent
  local content_width = 0
  for _, ntext in ipairs(content_texts) do
    content_width = content_width + ntext:width()
  end
  local indent_width = 0
  for _, ntext in ipairs(indent_texts) do
    indent_width = indent_width + ntext:width()
  end

  -- Build the RTL line: [left-padding] [content] [icon-gap] [mirrored-indent]
  local new_line = NuiLine()
  local gap = 1 -- space between content and tree guides
  local total_used = content_width + gap + indent_width
  local padding = math.max(0, win_width - total_used)

  if padding > 0 then
    new_line:append(string.rep(' ', padding))
  end

  -- Append content segments (name, icon, etc.) in original order (LTR readable)
  for _, ntext in ipairs(content_texts) do
    local hl = ntext.extmark and ntext.extmark.hl_group or nil
    new_line:append(ntext:content(), hl)
  end

  -- Gap between content and tree guides
  new_line:append(string.rep(' ', gap))

  -- Append indent segments in reverse order with mirrored characters
  for i = #indent_texts, 1, -1 do
    local ntext = indent_texts[i]
    local txt = mirror_chars(ntext:content())
    local hl = ntext.extmark and ntext.extmark.hl_group or nil
    new_line:append(txt, hl)
  end

  -- Preserve wanted_width for neo-tree's internal bookkeeping
  new_line.wanted_width = line.wanted_width
  return new_line
end

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  event = 'VimEnter',
  cmd = { 'Neotree', 'NeotreeToggleSide', 'NeotreeToggleRTL' },
  keys = {
    {
      '\\',
      function()
        vim.cmd('Neotree reveal position=' .. neotree_position)
      end,
      desc = 'NeoTree reveal',
      silent = true,
    },
    {
      '<leader>ee',
      function()
        vim.cmd('Neotree reveal position=' .. neotree_position)
      end,
      desc = 'NeoTree reveal',
      silent = true,
    },
  },
  opts = {
    -- Default also contains 'terminal', which makes neo-tree refuse to reuse a
    -- terminal window (e.g. the harpoon terminal) and open a split instead.
    open_files_do_not_replace_types = { 'Trouble', 'qf', 'edgy' },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<leader>ee'] = 'close_window',
        },
      },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)

    -- Wrap the NuiTree's prepare_node callback to transform lines for RTL.
    -- We hook into neo-tree's event system: after every render, if RTL is active
    -- and the prepare_node hasn't been wrapped yet, we wrap it.
    local events = require 'neo-tree.events'
    local patched_states = {}

    events.subscribe {
      event = events.AFTER_RENDER,
      handler = function(state)
        if not neotree_rtl then
          return
        end
        if not state or not state.tree or not state.tree._ then
          return
        end

        local internal = state.tree._
        -- Only wrap once per tree instance
        if patched_states[state] == internal.prepare_node then
          return
        end

        local original_prepare = internal.prepare_node
        internal.prepare_node = function(node, parent_node)
          local result = original_prepare(node, parent_node)
          if not neotree_rtl then
            return result
          end
          if result and result._texts then
            -- It's a NuiLine
            local win_width = state.winid and vim.api.nvim_win_get_width(state.winid) or 40
            return rtl_transform_line(result, win_width)
          end
          return result
        end
        patched_states[state] = internal.prepare_node

        -- Re-render the tree now that we've patched the prepare_node
        -- (this render already happened with the un-patched version)
        if state.tree and state.winid and vim.api.nvim_win_is_valid(state.winid) then
          state.tree:render()
        end
      end,
    }

    vim.api.nvim_create_user_command('NeotreeToggleSide', function()
      vim.cmd 'Neotree close'

      if neotree_position == 'left' then
        neotree_position = 'right'
      else
        neotree_position = 'left'
      end

      vim.cmd('Neotree reveal position=' .. neotree_position)
    end, { desc = 'Toggle NeoTree between left and right side' })

    vim.api.nvim_create_user_command('NeotreeToggleRTL', function()
      neotree_rtl = not neotree_rtl

      -- Clear patched state tracking so wrapping re-applies (or stops applying)
      patched_states = {}

      -- Force neo-tree to re-render
      local manager = require 'neo-tree.sources.manager'
      manager.refresh 'filesystem'
    end, { desc = 'Toggle right-to-left tree rendering in NeoTree' })

    -- Open NeoTree on the right side at session start
    vim.api.nvim_create_autocmd('VimEnter', {
      desc = 'Open NeoTree on the right at startup',
      once = true,
      callback = function()
        vim.cmd('Neotree reveal position=' .. neotree_position)
      end,
    })
  end,
}
