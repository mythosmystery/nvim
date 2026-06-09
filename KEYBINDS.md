# Neovim Keybinds

Leader key: `<Space>`

This document lists only keybinds explicitly defined in this config. Plugin default keymaps (e.g. mini.surround, gitsigns hunk navigation) are omitted.

Base distribution: **LazyVim** with custom overrides in `lua/config/keymaps.lua` and `lua/plugins/`.

---

## General

| Key          | Mode                   | Description                               | Source                           |
| ------------ | ---------------------- | ----------------------------------------- | -------------------------------- |
| `<Esc>`      | Normal                 | Clear search highlight                    | Built-in (`:noh`)                |
| `<C-c>`      | Normal, Visual, Insert | Exit to normal mode (alternative to Esc)  | Built-in (`<Esc>`)               |
| `<leader>w`  | Normal                 | Save all buffers (force write)            | Built-in (`:wa!`)                |
| `<leader>q`  | Normal                 | Quit current window                       | Built-in (`:q`)                  |
| `<leader>qq` | Normal                 | Quit all windows                          | Built-in (`:qa`)                 |
| `<C-x>`      | Normal                 | Delete current buffer (keeps window open) | snacks.nvim (`Snacks.bufdelete`) |

---

## Window & Buffer Navigation

| Key     | Mode   | Description                                  | Source              |
| ------- | ------ | -------------------------------------------- | ------------------- |
| `<C-h>` | Normal | Move focus left (Neovim split or tmux pane)  | vim-tmux-navigator  |
| `<C-j>` | Normal | Move focus down (Neovim split or tmux pane)  | vim-tmux-navigator  |
| `<C-k>` | Normal | Move focus up (Neovim split or tmux pane)    | vim-tmux-navigator  |
| `<C-l>` | Normal | Move focus right (Neovim split or tmux pane) | vim-tmux-navigator  |
| `<C-p>` | Normal | Previous buffer                              | Built-in (`:bprev`) |
| `<C-n>` | Normal | Next buffer                                  | Built-in (`:bnext`) |

---

## Line Movement

| Key       | Mode   | Description                | Source                              |
| --------- | ------ | -------------------------- | ----------------------------------- |
| `<C-S-j>` | Normal | Move current line down     | Custom (`functions.move_line_down`) |
| `<C-S-k>` | Normal | Move current line up       | Custom (`functions.move_line_up`)   |
| `J`       | Visual | Move selected line(s) down | Built-in (`:m` move command)        |
| `K`       | Visual | Move selected line(s) up   | Built-in (`:m` move command)        |

---

## Insert Mode Movement

These use `<C-o>` to run a one-shot normal-mode command without leaving insert mode.

| Key     | Mode   | Description               | Source             |
| ------- | ------ | ------------------------- | ------------------ |
| `<C-z>` | Insert | Undo                      | Built-in (`u`)     |
| `<C-j>` | Insert | Move cursor down one line | Built-in (`j`)     |
| `<C-k>` | Insert | Move cursor up one line   | Built-in (`k`)     |
| `<C-u>` | Insert | Scroll up half page       | Built-in (`<C-u>`) |
| `<C-d>` | Insert | Scroll down half page     | Built-in (`<C-d>`) |

---

## File Explorer & Outline

| Key         | Mode   | Description                        | Source                                              |
| ----------- | ------ | ---------------------------------- | --------------------------------------------------- |
| `<leader>e` | Normal | Toggle Neo-tree file explorer      | neo-tree.nvim                                       |
| `<leader>a` | Normal | Toggle Aerial code outline sidebar | aerial.nvim                                         |
| `{`         | Normal | Jump to previous symbol in outline | aerial.nvim (buffer-local, when Aerial is attached) |
| `}`         | Normal | Jump to next symbol in outline     | aerial.nvim (buffer-local, when Aerial is attached) |

---

## Telescope (Find / Search)

| Key                | Mode   | Description                            | Source                                                                     |
| ------------------ | ------ | -------------------------------------- | -------------------------------------------------------------------------- |
| `<leader><leader>` | Normal | Find files in project                  | telescope.nvim (`find_files`)                                              |
| `<leader>ff`       | Normal | Find files in project                  | telescope.nvim (`find_files`)                                              |
| `<leader>fc`       | Normal | Find files in Neovim config directory  | telescope.nvim (`find_files`, cwd = config path)                           |
| `<leader>fr`       | Normal | Find recently opened files             | telescope.nvim (`oldfiles`)                                                |
| `<leader>b`        | Normal | Find open buffers                      | telescope.nvim (`buffers`)                                                 |
| `<leader>fg`       | Normal | Live grep across project               | telescope.nvim (`live_grep`)                                               |
| `<leader>fw`       | Normal | Grep for word under cursor             | telescope.nvim (`grep_string`)                                             |
| `<leader>f/`       | Normal | Live grep in currently open files only | telescope.nvim (`live_grep` with `grep_open_files`)                        |
| `<leader>/`        | Normal | Fuzzy search within current buffer     | telescope.nvim (`current_buffer_fuzzy_find`)                               |
| `<leader>fh`       | Normal | Search help tags                       | telescope.nvim (`help_tags`)                                               |
| `<leader>fk`       | Normal | Search all keymaps                     | telescope.nvim (`keymaps`)                                                 |
| `<leader>fd`       | Normal | Search diagnostics                     | telescope.nvim (`diagnostics`)                                             |
| `<leader>ft`       | Normal | Browse and preview colorschemes        | telescope.nvim (`colorscheme`)                                             |
| `<leader>s`        | Visual | Grep for visually selected text        | telescope.nvim (`grep_string`) + custom (`functions.get_visual_selection`) |

### Telescope picker mappings

These apply while a Telescope picker is open.

| Key     | Mode           | Description                                  | Source                                  |
| ------- | -------------- | -------------------------------------------- | --------------------------------------- |
| `<C-t>` | Insert, Normal | Send results to Trouble                      | trouble.nvim + telescope.nvim           |
| `<C-d>` | Insert, Normal | Delete selected buffer (buffers picker only) | telescope.nvim (`delete_buffer` action) |

---

## LSP & Code Actions

Active in buffers with an attached LSP client.

| Key          | Mode   | Description                               | Source                                       |
| ------------ | ------ | ----------------------------------------- | -------------------------------------------- |
| `K`          | Normal | Show hover documentation                  | Built-in LSP (`vim.lsp.buf.hover`)           |
| `gd`         | Normal | Go to definition                          | Built-in LSP (`vim.lsp.buf.definition`)      |
| `gD`         | Normal | Go to type definition                     | Built-in LSP (`vim.lsp.buf.type_definition`) |
| `gi`         | Normal | Go to implementation                      | Built-in LSP (`vim.lsp.buf.implementation`)  |
| `gr`         | Normal | Show references in Trouble panel          | trouble.nvim + LSP                           |
| `cR`         | Normal | Rename symbol                             | Built-in LSP (`vim.lsp.buf.rename`)          |
| `<leader>ca` | Normal | Open code actions menu                    | Built-in LSP (`vim.lsp.buf.code_action`)     |
| `<leader>cf` | Normal | Format file                               | conform.nvim                                 |
| `<leader>ch` | Normal | Toggle inlay hints                        | Built-in LSP (`vim.lsp.inlay_hint`)          |
| `<leader>cr` | Normal | Restart LSP server                        | Built-in (`:LspRestart`)                     |
| `]]`         | Normal | Jump to next LSP reference occurrence     | snacks.nvim (`snacks.words`)                 |
| `[[`         | Normal | Jump to previous LSP reference occurrence | snacks.nvim (`snacks.words`)                 |

### Language support (via LazyVim extras)

Enabled in `lazyvim.json`: TypeScript, Python, Go, Astro, Vue, Tailwind, JSON, Markdown, YAML, TOML, Clojure. LSP servers and formatters are installed via mason.nvim.

---

## Completion (blink.cmp)

Active in insert mode when the completion menu is open.

| Key       | Mode   | Description                                                          | Source    |
| --------- | ------ | -------------------------------------------------------------------- | --------- |
| `<Tab>`   | Insert | Select next item and accept; fall back to default Tab if menu closed | blink.cmp |
| `<S-Tab>` | Insert | Select previous completion item                                      | blink.cmp |
| `<C-l>`   | Insert | Jump forward in snippet; fall back if not in snippet                 | blink.cmp |
| `<C-h>`   | Insert | Jump backward in snippet; fall back if not in snippet                | blink.cmp |

---

## Diagnostics (Trouble)

| Key          | Mode   | Description           | Source       |
| ------------ | ------ | --------------------- | ------------ |
| `<leader>xx` | Normal | Open diagnostics list | trouble.nvim |
| `<leader>xq` | Normal | Open quickfix list    | trouble.nvim |
| `<leader>xl` | Normal | Open location list    | trouble.nvim |

---

## Git (Fugitive)

| Key          | Mode   | Description | Source                       |
| ------------ | ------ | ----------- | ---------------------------- |
| `<leader>gs` | Normal | Git status  | vim-fugitive (`:Git`)        |
| `<leader>gc` | Normal | Git commit  | vim-fugitive (`:Git commit`) |
| `<leader>gp` | Normal | Git push    | vim-fugitive (`:Git push`)   |
| `<leader>gd` | Normal | Git diff    | vim-fugitive (`:Git diff`)   |
| `<leader>gb` | Normal | Git blame   | vim-fugitive (`:Git blame`)  |
| `<leader>gl` | Normal | Git log     | vim-fugitive (`:Git log`)    |

---

## Notes (Notle)

| Key           | Mode   | Description                   | Source     |
| ------------- | ------ | ----------------------------- | ---------- |
| `<leader>nt`  | Normal | Toggle Notle minesweeper game | notle.nvim |
| `<leader>fn`  | Normal | Search notes                  | notle.nvim |
| `<leader>fng` | Normal | Grep notes                    | notle.nvim |

---

## Motion (Flash)

Overrides the default `s` (substitute character) behavior.

| Key | Mode                             | Description                          | Source     |
| --- | -------------------------------- | ------------------------------------ | ---------- |
| `s` | Normal, Visual, Operator-pending | Labeled jump to any visible location | flash.nvim |
| `S` | Normal, Visual, Operator-pending | Labeled jump using Treesitter nodes  | flash.nvim |

---

## Plugin Management

| Key          | Mode   | Description                             | Source                      |
| ------------ | ------ | --------------------------------------- | --------------------------- |
| `<leader>Pi` | Normal | Install missing Lazy plugins            | lazy.nvim (`:Lazy install`) |
| `<leader>Ps` | Normal | Sync plugins                            | lazy.nvim (`:Lazy sync`)    |
| `<leader>Pc` | Normal | Clean unused plugins                    | lazy.nvim (`:Lazy clean`)   |
| `<leader>Pm` | Normal | Open Mason (LSP/formatter installer UI) | mason.nvim                  |

---

## Clojure (Conjure)

| Key  | Mode   | Description                                            | Source                                    |
| ---- | ------ | ------------------------------------------------------ | ----------------------------------------- |
| `gk` | Normal | Show documentation for word under cursor (Conjure doc) | conjure.nvim (`conjure#mapping#doc_word`) |

---

## which-key Groups

These do not bind actions themselves; they organize the leader menu in which-key.nvim.

| Prefix      | Group label |
| ----------- | ----------- |
| `<leader>a` | Aerial      |
| `<leader>c` | Code        |
| `<leader>f` | Find        |
| `<leader>g` | Git         |
| `<leader>P` | Plugins     |
| `<leader>x` | Trouble     |
