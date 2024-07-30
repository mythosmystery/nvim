return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = require("functions").get_system_theme() == "dark" and "tokyonight" or "papercolor",
			},
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
		-- cond = function()
		-- 	return require("functions").get_system_theme() == "dark"
		-- end,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				styles = {
					sidebars = "normal",
					floats = "normal",
				},
			})
			if require("functions").get_system_theme() == "dark" then
				vim.cmd("colorscheme tokyonight")
				vim.opt.background = "dark"
			end
		end,
	},
	{
		"NLKNguyen/papercolor-theme",
		priority = 1000,
		-- cond = function()
		-- 	return require("functions").get_system_theme() == "light"
		-- end,
		config = function()
			if require("functions").get_system_theme() == "light" then
				vim.cmd("colorscheme PaperColor")
				vim.opt.background = "light"
			end
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {},
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	cond = vim.g.neovide ~= nil,
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	config = function()
	-- 		require("noice").setup({
	-- 			lsp = {
	-- 				progress = {
	-- 					enabled = false,
	-- 				},
	-- 			},
	-- 			routes = {
	-- 				{
	-- 					view = "notify",
	-- 					filter = { event = "msg_showmode" },
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
