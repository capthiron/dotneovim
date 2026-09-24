# Neovim Cheatsheet

Open with `<leader>?`, close with `q`. This is a normal file: edit it and `:w` as you learn things.
Everything else: `<leader>sk` (fuzzy search keymaps), `<leader>` + wait (which-key), `:help index`.

## Help yourself

- `K` hover docs / signature of symbol under cursor (again to enter float)
- `<leader>sk` search all keymaps by description
- `<leader>sh` search `:help`
- `<leader>ss` pick any Telescope picker
- `:WhichKey` every mapping in one popup

## Moving

- `w` `b` `e` word forward / back / end (`W` `B` `E` ignore punctuation)
- `0` `^` `$` line start / first non-blank / end
- `f{c}` `t{c}` to / till char (`F` `T` backwards), `;` `,` repeat / reverse
- `%` matching bracket
- `{` `}` previous / next blank line (paragraph)
- `gg` `G` file start / end, `42G` line 42
- `<C-d>` `<C-u>` half page down / up
- `H` `M` `L` top / middle / bottom of screen
- `zz` `zt` `zb` scroll cursor line to center / top / bottom
- `*` `#` search word under cursor forward / back, `n` `N` next / prev

## Jumping

- `s{c}{c}` leap to any two-char sequence on screen, `S` leap into other windows
- `/pattern` then a label: leap jumps to any match when there are several
- `<C-o>` `<C-i>` jump back / forward (also `<Left>` `<Right>`)
- `g;` `g,` previous / next change position
- `gi` go to last insert position and enter insert mode
- `` `. `` last change, `` `` `` back to previous position
- `m{a}` set mark, `` `{a} `` go to mark (`mA` uppercase marks work across files)

## Text objects (use with `d` `c` `y` `v`)

- `iw` `aw` word, `ip` `ap` paragraph
- `i"` `a"` `i(` `a(` `i{` `it` quotes / parens / braces / tag contents
- `ib` any bracket, `iq` any quote (mini.ai)
- `ia` `aa` function argument (mini.ai)
- `if` `af` function call (mini.ai)
- `in"` `il(` next / last object on the line, e.g. `cin"` change inside next quotes
- Examples: `ciw` change word, `dap` delete paragraph, `yi(` yank inside parens, `ca"` change including quotes

## Editing

- `.` repeat last change (most underrated key)
- `u` undo, `<C-r>` redo
- `J` join line below, `gS` split / join argument list or struct (mini.splitjoin)
- `>>` `<<` indent, `=ip` reindent paragraph, `gg=G` reindent file
- `gU{motion}` `gu{motion}` upper / lower case, `~` toggle char case
- `<C-a>` `<C-x>` increment / decrement number under cursor
- `xp` swap two chars, `ddp` swap two lines
- `[<Space>` `]<Space>` add blank line above / below
- `gv` reselect last visual selection
- `<C-v>` block visual, then `I` / `A` to insert on every line, `$A` to append at line ends

## Surround (your mappings)

- `gs{motion}{char}` add, e.g. `gsiw"` wraps word in quotes, `gsiw)` in parens
- `ds{char}` delete, e.g. `ds"`
- `rs{old}{new}` replace, e.g. `rs"'`
- `fs` `Fs` find surrounding right / left, `hs` highlight it

## Comments

- `gcc` toggle line comment, `gc{motion}` e.g. `gcap` comment paragraph, `gc` in visual

## Registers, clipboard and macros

- `<leader>y` yank to system clipboard
- `"0p` paste last yank (not the last delete)
- `"_d` delete without overwriting the register
- `:reg` show registers
- `q{a}` record macro into `a`, `q` stop, `@a` play, `@@` replay, `5@a` play five times

## Insert mode

- `jk` escape
- `<C-w>` delete word back, `<C-u>` delete to line start
- `<C-r>{reg}` paste register, e.g. `<C-r>"` or `<C-r>+`
- `<C-o>{cmd}` run one normal mode command
- `<C-s>` signature help
- Completion: `<C-Space>` open, `<C-n>` `<C-p>` select, `<CR>` accept, `<C-e>` close

## LSP

- `K` hover
- `gd` definition, `gD` declaration, `gt` type definition, `gI` implementation
- `gr` references (Telescope)
- `<leader>D` type definitions (Telescope)
- `<leader>ds` document symbols, `<leader>ws` workspace symbols, `gO` symbols outline in loclist
- `<leader>o` toggle Outline sidebar
- `<leader>rn` rename, `<leader>ca` code action (cursor must be inside the diagnostic range)
- `<leader>f` format buffer
- `<leader>th` toggle inlay hints

## Diagnostics

- `]d` `[d` next / prev (opens float), `]D` `[D` last / first
- `<C-w>d` float for diagnostic under cursor (shows source and analyzer code)
- `<leader>cd` open the docs page for the diagnostic under cursor
- `<leader>q` diagnostics to location list, `<leader>sd` search diagnostics

## Search (Telescope)

- `<leader>sf` files, `<leader>sg` live grep, `<leader>sw` grep word under cursor
- `<leader><leader>` open buffers, `<leader>s.` recent files
- `<leader>/` fuzzy search current buffer, `<leader>s/` grep open files
- `<leader>sr` resume last picker (keeps your query)
- `<leader>sn` search Neovim config files
- Inside a picker: `<C-/>` (insert) or `?` (normal) shows picker keys, `<C-q>` send all results to quickfix

## Quickfix and location list

- `]q` `[q` next / prev quickfix item, `]l` `[l` next / prev location list item
- `:copen` `:cclose` open / close
- `:cdo s/old/new/g | update` replace in every quickfix hit (grep, `<C-q>`, then this)

## Search and replace

- `:%s/old/new/gc` replace in file with confirm
- `:%s//new/g` reuse last search pattern (search with `*` first)
- `&` repeat last substitute on current line, `g&` on whole file
- `:g/pattern/d` delete all matching lines, `:v/pattern/d` delete non-matching
- `:g/pattern/norm A;` run normal commands on matching lines
- `q:` command history window, `<C-f>` in cmdline to edit it as a buffer

## Buffers and windows

- `]b` `[b` next / prev buffer, `:bd` close buffer
- `<C-h>` `<C-j>` `<C-k>` `<C-l>` move between windows
- `<C-w>s` `<C-w>v` split horizontal / vertical, `<C-w>q` close, `<C-w>o` only this window
- `<C-w>=` equalize sizes, `<C-w>_` `<C-w>|` maximize height / width

## Files

- `\` or `<leader>ee` reveal current file in NeoTree
- `:NeotreeToggleSide` move tree left / right
- Harpoon: `<leader>hm` mark file, `<leader>hh` menu, `<leader>hc` clear
- Harpoon slots: `<leader>jj` 1, `<leader>kk` 2, `<leader>ll` 3, `<leader>;;` 4

## Git

- `]c` `[c` next / prev hunk
- `<leader>hp` preview hunk, `<leader>hs` stage, `<leader>hr` reset, `<leader>hu` undo stage
- `<leader>hS` stage buffer, `<leader>hR` reset buffer
- `<leader>hb` blame line, `<leader>tb` toggle inline blame, `<leader>tD` toggle deleted lines
- `<leader>hd` diff against index, `<leader>hD` diff against last commit
- `<leader>lg` LazyGit, `:Git` fugitive

## Folds

- `za` toggle fold, `zo` `zc` open / close, `zR` `zM` open / close all

## Debug

- `<leader>5` start / continue, `<leader>1` step into, `<leader>2` step over, `<leader>3` step out
- `<leader>b` toggle breakpoint, `<leader>B` conditional breakpoint, `<leader>7` toggle debug UI

## opencode

- `<leader>ct` toggle, `<leader>cA` ask, `<leader>ca` ask about selection (visual)
- `<leader>ce` explain code, `<leader>cs` select prompt, `<leader>cn` new session, `<leader>cy` copy last response

## Terminal

- `<Esc><Esc>` leave terminal mode

## Toggles

- `<leader>th` inlay hints, `<leader>tb` git blame, `<leader>tD` git deleted, `<leader>tt` transparent background
- `<leader>tc` theme family picker (also switches Ghostty and opencode), or `theme <family>` in the shell
