return {
	-- Auto-pair brackets, quotes, etc.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	{
		"echasnovski/mini.nvim",
		keys = {
			{
				"<C-x>",
				function()
					require("mini.bufremove").delete()
				end,
				desc = "Delete Buffer",
			},
		},
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			require("mini.bufremove").setup()
			require("mini.comment").setup()
		end,
	},
}
