return {
	{ "nanotee/zoxide.vim", dependencies = {
		"junegunn/fzf",
	} },
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			default_file_explorer = false,
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"echasnovski/mini.nvim",
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
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

			require("mini.files").setup({
				mappings = {
					go_in_plus = "<cr>",
				},
				-- options = {
				-- 	use_as_default_explorer = false,
				-- },
			})

			vim.keymap.set("n", "<C-x>", require("mini.bufremove").delete, { desc = "Delete Buffer" })
			vim.keymap.set("n", "<leader>e", require("mini.files").open, { desc = "[E]dit Filesystem" })
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
