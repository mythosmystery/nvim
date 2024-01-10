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
			e = { "<cmd> Neotree filesystem toggle left<cr>", "Open File tree" },
			w = { "<cmd>w!<cr>", "Save" },
			q = { "<cmd>wq!<cr>", "Save and Quit" },
			f = {
				name = "file",
				f = { "<cmd> Telescope find_files<cr>", "Find File" },
				g = { "<cmd> Telescope live_grep<cr>", "Grep Project" },
				s = { "<cmd> Telescope grep_string<cr>", "Grep String" },
        S = { "<cmd> Telescope grep_string search=\\v<cr>", "Grep String (regex)" },
			},
			h = {
				name = "harpoon",
				h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Menu" },
				c = { "<cmd>lua require('harpoon.mark').clear_all_marks()<cr>", "Clear Marks" },
				m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Mark" },
			},
			b = {
				name = "buffer",
				b = { "<cmd>BufferLineCyclePrev<cr>", "Prev" },
				n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
				c = { "<cmd>Bdelete<cr>", "Kill" },
				f = { "<cmd>Telescope buffers previewers=false<cr>", "Find" },
			},
			c = {
				name = "code",
				a = { vim.lsp.buf.code_action, "Code Actions" },
				f = { vim.lsp.buf.format, "Format File" },
			},
			[" "] = { "<cmd> Telescope find_files<cr>", "Search" },
			s = {
				name = "Search",
				b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				f = { "<cmd>Telescope find_files<cr>", "Find File" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
				M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
				R = { "<cmd>Telescope registers<cr>", "Registers" },
				t = { "<cmd>Telescope live_grep<cr>", "Text" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				C = { "<cmd>Telescope commands<cr>", "Commands" },
				l = { "<cmd>Telescope resume<cr>", "Resume last search" },
				p = {
					"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
					"Colorscheme with Preview",
				},
			},
			p = {
				name = "Plugins",
				i = { "<cmd>Lazy install<cr>", "Install" },
				s = { "<cmd>Lazy sync<cr>", "Sync" },
				S = { "<cmd>Lazy clear<cr>", "Status" },
				c = { "<cmd>Lazy clean<cr>", "Clean" },
				u = { "<cmd>Lazy update<cr>", "Update" },
				p = { "<cmd>Lazy profile<cr>", "Profile" },
				l = { "<cmd>Lazy log<cr>", "Log" },
				d = { "<cmd>Lazy debug<cr>", "Debug" },
				M = { "<cmd>Mason<cr>", "Mason" },
			},
		}, { prefix = "<leader>" })
		wk.register({
			f = {
				name = "file",
				s = { "<cmd>Telescope grep_string<cr>", "Grep String" },
			},
		}, { prefix = "<leader>", mode = "v" })
	end,
}
