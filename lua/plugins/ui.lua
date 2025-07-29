return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
		},
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
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- },
}
