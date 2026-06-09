return {
  {
    "stevearc/aerial.nvim",
    keys = {
      { "<leader>cs", false },
    },
    opts = {
      backends = { "lsp", "treesitter" },
    },
    config = function(_, opts)
      require("aerial").setup(opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "AerialAttach",
        callback = function(event)
          local aerial = require("aerial")
          vim.keymap.set("n", "{", function()
            aerial.prev({ move_cursor = true, move_stack = false })
          end, { buffer = event.buf, desc = "Previous symbol" })
          vim.keymap.set("n", "}", function()
            aerial.next({ move_cursor = true, move_stack = false })
          end, { buffer = event.buf, desc = "Next symbol" })
        end,
      })
    end,
  },
}
