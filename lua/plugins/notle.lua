return {
	dir = "~/Documents/notle.nvim",
	config = function()
		require("notle").setup()

		vim.keymap.set("n", "<leader>nn", require("notle").toggle, { desc = "Toggle [N]ote Window" })
		vim.keymap.set("n", "<leader>nf", require("notle").search_notes, { desc = "[F]ind" })
		vim.keymap.set("n", "<leader>ng", require("notle").grep_notes, { desc = "[G]rep" })

		vim.keymap.set("v", "<leader>n", function()
			require("notle").grep_notes(require("functions").get_visual_selection())
		end, { desc = "Grep [N]otes" })
	end,
}
