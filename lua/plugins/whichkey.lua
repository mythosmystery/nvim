return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			d = { name = "[D]ap", _ = "which_key_ignore", },
			y = { name = "[Y]chat", _ = "which_key_ignore" },
			c = { name = "[C]ode", _ = "which_key_ignore", },
			t = { name = "[T]erminal", _ = "which_key_ignore", },
			u = { name = "[U]ndo", _ = "which_key_ignore", },
			g = { name = "[G]it", _ = "which_key_ignore",
				o = { name = "[O]cto (Github)", _ = "which_key_ignore", },
			},
			f = { name = "[F]ind", _ = "which_key_ignore", },
			x = { name = "[X]rouble", _ = "which_key_ignore", },
			P = { name = "[P]lugins", _ = "which_key_ignore", },
		}, { prefix = "<leader>" })
	end,
}
