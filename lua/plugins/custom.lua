return {
	"mythosmystery/notle.nvim",
	config = function()
		require("notle").setup()

		vim.keymap.set("n", "<leader>nt", require("notle").toggle, { desc = "Toggle [N]otle" })
		vim.keymap.set("n", "<leader>fn", require("notle").search_notes, { desc = "[F]ind [N]otes" })
		vim.keymap.set("n", "<leader>fng", require("notle").grep_notes, { desc = "[F]ind [G]rep [N]otes" })
	end,
}
