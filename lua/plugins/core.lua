return {
	-- Which-key: keybind hints
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>a", group = "[A]erial" },
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>f", group = "[F]ind" },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>P", group = "[P]lugins" },
				{ "<leader>x", group = "[X]rouble" },
			})
		end,
	},

	-- TODO/FIXME highlighting
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	-- Shell cd integration
	{ "nanotee/zoxide.vim", dependencies = { "junegunn/fzf" } },

	-- Minesweeper
	{
		"mythosmystery/notle.nvim",
		config = function()
			require("notle").setup()

			vim.keymap.set("n", "<leader>nt", require("notle").toggle, { desc = "Toggle [N]otle" })
			vim.keymap.set("n", "<leader>fn", require("notle").search_notes, { desc = "[F]ind [N]otes" })
			vim.keymap.set("n", "<leader>fng", require("notle").grep_notes, { desc = "[F]ind [G]rep [N]otes" })
		end,
	},

	-- Flash: instant labeled jumping
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
		},
		opts = {},
	},

	-- Aerial: code outline
	{
		"stevearc/aerial.nvim",
		cmd = "AerialToggle",
		opts = {
			backends = { "lsp", "treesitter" },
		},
		config = function(_, opts)
			require("aerial").setup(opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "AerialAttach",
				callback = function(event)
					local aerial = require("aerial")
					vim.keymap.set("n", "{", function()
						aerial.prev({ move_cursor = true, move_stack = false })
					end, { buffer = event.buf, desc = "Previous symbol" })
					vim.keymap.set("n", "}", function()
						aerial.next({ move_cursor = true, move_stack = false })
					end, { buffer = event.buf, desc = "Next symbol" })
				end,
			})
		end,
	},
}
