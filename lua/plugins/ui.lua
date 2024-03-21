return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
				},
			})
		end,
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
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		cond = vim.g.neovide ~= nil,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					progress = {
						enabled = false,
					},
				},
				routes = {
					{
						view = "notify",
						filter = { event = "msg_showmode" },
					},
				},
			})
		end,
	},
}
