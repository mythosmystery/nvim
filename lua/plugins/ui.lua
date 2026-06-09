return {
	-- Theme
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

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
			extensions = { "neo-tree" },
		},
	},

	-- Diagnostics panel
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup()

			vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics<cr>", { desc = "Trouble Diagnostics" })
			vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { desc = "[Q]uickfix" })
			vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { desc = "[L]ocation List" })
		end,
	},

	-- File explorer sidebar (must load eagerly for netrw hijack on `nvim .`)
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					position = "left",
					width = 40,
				},
				filesystem = {
					hijack_netrw_behavior = "open_default",
					-- Watch for external file/directory changes (AI agents, other editors)
					watch_for_changes = true,
					-- Follow the currently edited file in the tree
					follow_current_file = true,
					-- Ignore hidden files in the watcher
					filter_gitignored = false,
				},
				sources = { "filesystem", "buffers", "git_status" },
				source_selector = {
					winbar = true,
				},
			})
		end,
	},

	-- QoL collection (dim, words, indent, statuscolumn, bigfile, quickfile, scope, scroll)
	{
		"folke/snacks.nvim",
		priority = 1000,
		keys = {
			{
				"]]",
				function()
					require("snacks.words").jump()
				end,
				desc = "Next LSP Reference",
			},
			{
				"[[",
				function()
					require("snacks.words").jump({ count = -1 })
				end,
				desc = "Prev LSP Reference",
			},
		},
		opts = {
			bigfile = { enabled = true },
			dim = { enabled = true },
			indent = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},

	-- File icons
	{ "nvim-tree/nvim-web-devicons" },
}
