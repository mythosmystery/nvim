return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local trouble = require("trouble.providers.telescope")
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
        pickers = {
          buffers = {
            show_all_buffers = true,
            sort_mru = true,
            mappings = {
              i = {
                ["<C-d>"] = "delete_buffer",
              },
              n = {
                ["<C-d>"] = "delete_buffer",
              },
            },
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
