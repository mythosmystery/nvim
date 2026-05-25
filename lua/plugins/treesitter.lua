return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
		},
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = {
					enable = true,
					filetypes = { "html", "svelte", "vue", "jsx", "tsx" },
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["aC"] = "@comment.outer",
							["iC"] = "@comment.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
						},
					},
				},
			})
			vim.treesitter.language.register("markdown", { "octo" })

			-- Disable treesitter-context for markdown: injected child parsers
			-- crash when the injected language is invalid/missing.
			-- This is a known Neovim 0.12 issue with the injection query system.
			require("treesitter-context").setup({
				enable = true,
				on_attach = function(bufnr)
					local ft = vim.bo[bufnr].filetype
					return ft ~= "markdown" and ft ~= "mdx"
				end,
			})
		end,
	},
}
