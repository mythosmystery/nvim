return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
    messages = {
      enabled = false
    },
    notify = {
      enabled = false
    }
	},
}
