return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      window = {
        position = "left",
        width = 40,
      },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filter_gitignored = false,
      },
      sources = { "filesystem", "buffers", "git_status" },
      source_selector = {
        winbar = true,
      },
    },
  },
}
