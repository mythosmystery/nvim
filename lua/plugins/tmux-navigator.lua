return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  init = function()
    -- Keymaps are set in config/keymaps.lua after LazyVim defaults load.
    vim.g.tmux_navigator_no_mappings = 1
  end,
}
