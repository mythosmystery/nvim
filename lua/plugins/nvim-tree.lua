return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({})
    vim.api.nvim_create_autocmd({ "QuitPre" }, {
      callback = function()
        vim.cmd("NvimTreeClose")
      end,
    })
  end,
}
