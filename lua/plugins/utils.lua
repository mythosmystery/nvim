return {
	{ "nanotee/zoxide.vim", dependencies = {
		"junegunn/fzf",
	} },
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			require("mini.bufremove").setup()

			require("mini.comment").setup()

			require("mini.pairs").setup()

			require("mini.files").setup()

			vim.keymap.set("n", "<C-x>", require("mini.bufremove").delete, { desc = "Delete Buffer" })
			vim.keymap.set("n", "<leader>e", require("mini.files").open, { desc = "Open File Browser" })
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>uu", "<cmd>UndotreeToggle<cr>", { desc = "[U]ndo Toggle" })
			vim.keymap.set("n", "<leader>us", "<cmd>UndotreeShowDiff<cr>", { desc = "[S]how Diff" })
			vim.keymap.set("n", "<leader>uc", "<cmd>UndotreeClear<cr>", { desc = "[C]lear" })
		end,
	},
}
