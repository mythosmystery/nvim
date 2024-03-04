return {
  dir = "~/Documents/ychat.nvim",
  config = function()
    require("ychat").setup()

    vim.keymap.set("n", "<leader>yy", require("ychat").toggle_chat, { desc = "Toggle yChat" })
    vim.keymap.set("n", "<leader>ys", require("ychat").send, { desc = "Send Message" })
    vim.keymap.set("n", "<leader>yr", "<cmd>Lazy reload ychat.nvim<cr>", { desc = "Reload yChat" })
  end,
}
