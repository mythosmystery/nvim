return {
  {
    "dundalek/parpar.nvim",
    dependencies = {
      "gpanders/nvim-parinfer",
      "julienvincent/nvim-paredit",
    },
    opts = {},
  },
  {
    "clojure-vim/vim-jack-in",
  },
  {
    "olical/conjure",
    init = function()
      vim.g["conjure#mapping#doc_word"] = "gk"
    end,
  },
}
