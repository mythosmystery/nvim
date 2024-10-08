return {
	{
		"olical/conjure",
		dependencies = {
			"clojure-vim/vim-jack-in",
			dependencies = {
				"tpope/vim-dispatch",
			},
		},
		config = function()
			vim.g["conjure#mapping#doc_word"] = "gk"
		end,
	},
	{
		"dundalek/parpar.nvim",
		dependencies = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
		opts = {},
	},
}
