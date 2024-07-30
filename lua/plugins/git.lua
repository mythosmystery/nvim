return {
	{
		"tpope/vim-fugitive",
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
}
