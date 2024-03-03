return {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })
    vim.keymap.set(
      "n",
      "<leader>h",
      '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>',
      { desc = "[H]arpoon Menu" }
    )
    vim.keymap.set("n", "<leader>m", '<cmd>lua require("harpoon.mark").add_file()<cr>', { desc = "Add [M]ark" })
    vim.keymap.set("n", "<leader>n", '<cmd>lua require("harpoon.ui").nav_next()<cr>', { desc = "[N]ext" })
    vim.keymap.set("n", "<leader>p", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', { desc = "[P]rev" })
  end,
}
