return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- options = {
			-- 	theme = "tokyonight",
			-- },
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		cmd = { "NvimTreeToggle", "NvimTreeOpen" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			sync_root_with_cwd = true,
			diagnostics = {
				enable = true,
			},
			renderer = {
				highlight_diagnostics = true,
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
}
