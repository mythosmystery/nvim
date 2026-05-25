return {
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
			require("mini.pairs").setup()
		end,
	},
}
