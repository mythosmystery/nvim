return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	config = function()
		require("harpoon").setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		})
		vim.keymap.set("n", "<leader>h", require("harpoon.ui").toggle_quick_menu, { desc = "[H]arpoon" })
		vim.keymap.set("n", "<leader>hm", require("harpoon.mark").add_file, { desc = "Add [M]ark" })
		vim.keymap.set("n", "<leader>hn", require("harpoon.ui").nav_next, { desc = "[N]ext" })
		vim.keymap.set("n", "<leader>hp", require("harpoon.ui").nav_prev, { desc = "[P]rev" })
	end,
}
