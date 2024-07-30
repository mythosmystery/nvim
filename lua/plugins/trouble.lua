return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup()

		vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble" })
		vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics<cr>", { desc = "[D]ocument Diagnostics" })
		vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { desc = "[Q]uickfix" })
		vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { desc = "[L]ocation List" })
	end,
}
