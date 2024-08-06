return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				transparent = true,
			})
			vim.cmd("colorscheme tokyonight")
			vim.opt.background = "dark"
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {},
	},
}
