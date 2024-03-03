return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>uu", "<cmd>UndotreeToggle<cr>", { desc = "[U]ndo Toggle" })
    vim.keymap.set("n", "<leader>us", "<cmd>UndotreeShowDiff<cr>", { desc = "[S]how Diff" })
    vim.keymap.set("n", "<leader>uc", "<cmd>UndotreeClear<cr>", { desc = "[C]lear" })
  end,
}
