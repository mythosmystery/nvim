return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>y", { group = "[Y]chat" } },
			{ "<leader>d", { group = "[D]ap" } },
			{ "<leader>c", { group = "[C]ode" } },
			{ "<leader>t", { group = "[T]erminal" } },
			{ "<leader>u", { group = "[U]ndo" } },
			{ "<leader>g", { group = "[G]it" } },
			{ "<leader>n", { group = "[N]otes" } },
			{ "<leader>f", { group = "[F]ind" } },
			{ "<leader>x", { group = "[X]rouble" } },
			{ "<leader>P", { group = "[P]lugins" } },
		})
	end,
}
