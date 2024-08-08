return {
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		config = function()
			require("harpoon").setup({
				global_settings = {
					save_on_toggle = true,
					save_on_change = true,
				},
			})
			vim.keymap.set("n", "<leader>h", require("harpoon.ui").toggle_quick_menu, { desc = "[H]arpoon Menu" })
			vim.keymap.set("n", "<leader>m", require("harpoon.mark").add_file, { desc = "Add [M]ark" })
			vim.keymap.set("n", "<leader>n", require("harpoon.ui").nav_next, { desc = "Harpoon [N]ext" })
			vim.keymap.set("n", "<leader>p", require("harpoon.ui").nav_prev, { desc = "Harpoon [P]rev" })
		end,
	},
	{
		"leath-dub/snipe.nvim",
		keys = {
			{
				"<leader>s",
				function()
					require("snipe").open_buffer_menu()
				end,
				desc = "Open [S]nipe",
			},
		},
		opts = {},
	},
}
