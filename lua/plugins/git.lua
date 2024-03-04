return {
	{
		"tpope/vim-fugitive",
		cmd = "Git",
		config = function()
			vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git [S]tatus" })
			vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git [C]ommit" })
			vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Git [P]ush" })
			vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<cr>", { desc = "Git [D]iff" })
			vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git [B]lame" })
			vim.keymap.set("n", "<leader>gl", "<cmd>Git log<cr>", { desc = "Git [L]og" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
		},
	},
	{
		"pwntester/octo.nvim",
		cmd = "Octo",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
			vim.keymap.set("n", "<leader>goi", "<cmd>Octo issue list<cr>", { desc = "[I]ssue List" })
			vim.keymap.set("n", "<leader>goI", "<cmd>Octo issue create<cr>", { desc = "[I]ssue Create" })
			vim.keymap.set("n", "<leader>gop", "<cmd>Octo pr list<cr>", { desc = "[P]R List" })
			vim.keymap.set("n", "<leader>goP", "<cmd>Octo pr create<cr>", { desc = "[P]R Create" })
		end,
	},
}
