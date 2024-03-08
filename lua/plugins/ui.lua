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
		cmd = "NvimTreeToggle",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			sync_root_with_cwd = true,
			diagnostics = {
				enable = true,
			},
			renderer = {
				highlight_diagnostics = "all",
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
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			if vim.g.neovide then
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
			end
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			if vim.g.neovide then
				local alpha = require("alpha")
				local dashboard = require("alpha.themes.startify")

				dashboard.section.header.val = {
					[[                                                                     ]],
					[[       ████ ██████           █████      ██                     ]],
					[[      ███████████             █████                             ]],
					[[      █████████ ███████████████████ ███   ███████████   ]],
					[[     █████████  ███    █████████████ █████ ██████████████   ]],
					[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
					[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
					[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
					[[                                                                       ]],
				}

				alpha.setup(dashboard.opts)
			end
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			if vim.g.neovide then
				require("bufferline").setup({
					options = {
						diagnostics = "nvim_lsp",
						diagnostics_indicator = function(count, level)
							local icon = level:match("error") and "" or ""
							return " " .. icon .. count
						end,
						offsets = {
							{
								filetype = "NvimTree",
								text = "File Explorer",
								text_align = "center",
							},
						},
					},
				})
			end
		end,
	},
}
