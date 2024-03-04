return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			local trouble = require("trouble.providers.telescope")

			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = {
					mappings = {
						i = { ["<c-t>"] = trouble.open_with_trouble },
						n = { ["<c-t>"] = trouble.open_with_trouble },
					},
				},
				pickers = {
					buffers = {
						show_all_buffers = true,
						sort_mru = true,
						mappings = {
							i = {
								["<C-d>"] = "delete_buffer",
							},
							n = {
								["<C-d>"] = "delete_buffer",
							},
						},
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent Files" })
			vim.keymap.set("n", "<leader>fb", builtin.git_branches, { desc = "[F]ind [B]ranches" })
			vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Find existing [B]uffers" })
			vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })

			vim.keymap.set("v", "<leader>s", function()
				require("telescope.builtin").grep_string({ search = require("functions").get_visual_selection() })
			end, { desc = "Grep Visual Selection" })

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("git_worktree")
		end,
	},
}
