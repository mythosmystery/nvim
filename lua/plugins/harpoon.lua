return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		})
		vim.keymap.set("n", "<leader>h", require("harpoon.ui").toggle_quick_menu, { desc = "[H]arpoon Menu" })
		vim.keymap.set("n", "<leader>m", require("harpoon.mark").add_file, { desc = "Add [M]ark" })
		vim.keymap.set("n", "<leader>n", require("harpoon.ui").nav_next, { desc = "[N]ext" })
		vim.keymap.set("n", "<leader>p", require("harpoon.ui").nav_prev, { desc = "[P]rev" })
	end,
}
