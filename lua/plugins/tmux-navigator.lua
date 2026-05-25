return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = "n" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", mode = "n" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", mode = "n" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = "n" },
	},
}
