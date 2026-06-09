-- nvim-treesitter v1 (main branch) for Neovim 0.12+
-- Highlighting is built into Neovim; this plugin manages parsers/queries.
-- treesitter-context adds sticky scope lines at the top of the window.

local parsers = {
	"astro",
	"bash",
	"clojure",
	"css",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			require("nvim-treesitter").setup()

			-- No-op when parsers are already installed; :TSUpdate in build keeps them current
			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter-highlight", { clear = true }),
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})

			vim.treesitter.language.register("markdown", { "octo" })

			require("treesitter-context").setup({
				enable = true,
				on_attach = function(bufnr)
					local ft = vim.bo[bufnr].filetype
					-- Disable for markdown/mdx (injection crash in nvim 0.12)
					return ft ~= "markdown" and ft ~= "mdx"
				end,
			})
		end,
	},
}
