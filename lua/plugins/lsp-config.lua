local servers = {
	"tsserver",
	"rust_analyzer",
	"clangd",
	"gopls",
	"elixirls",
	"vuels",
	"pyright",
	"cssls",
	"html",
	"tailwindcss",
	"svelte",
	"templ",
	"lua_ls",
	"bashls",
	"eslint",
}

return {
	{
		"lvimuser/lsp-inlayhints.nvim",
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
	{
		"LhKipp/nvim-nu",
		config = function()
			require("nu").setup({
				-- options go here
				use_lsp_features = true,
			})
		end,
	},
	{ "folke/neodev.nvim" },
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "eslint_d", "prettier" } },
				typescript = { { "eslint_d", "prettier" } },
				typescriptreact = { { "eslint_d", "prettier" } },
				vue = { { "eslint_d", "prettier" } },
				svelte = { { "eslint_d", "prettier" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("neodev").setup()

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local lspconfig = require("lspconfig")

			for _, server in ipairs(servers) do
				local opts = {
					capabilities = capabilities,
				}

				if server == "rust_analyzer" then
					opts.settings = {
						["rust-analyzer"] = {
							inlayHints = {
								auto = true,
							},
							check = {
								command = "clippy",
							},
						},
					}
				end

				lspconfig[server].setup(opts)
			end

			vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = "LspAttach_inlayhints",
				callback = function(args)
					if not (args.data and args.data.client_id) then
						return
					end

					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					require("lsp-inlayhints").on_attach(client, bufnr)

					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
					vim.keymap.set("n", "<leader>cf", require("conform").format, { desc = "[F]ormat File" })

					vim.keymap.set(
						"n",
						"<leader>ch",
						require("lsp-inlayhints").toggle,
						{ desc = "Toggle Inlay [H]ints" }
					)

					vim.keymap.set("n", "<leader>cr", "<cmd>LspRestart<cr>", { desc = "[R]estart LSP" })
					vim.keymap.set("n", "cR", vim.lsp.buf.rename, { desc = "[R]ename" })

					vim.keymap.set("n", "gd", function()
						require("trouble").toggle("lsp_definitions")
					end, { desc = "[G]oto [D]efinition" })

					vim.keymap.set("n", "gD", function()
						require("trouble").toggle("lsp_type_definitions")
					end, { desc = "[G]oto Type [D]efinition" })

					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })

					vim.keymap.set("n", "gr", function()
						require("trouble").toggle("lsp_references")
					end, { desc = "[G]oto [R]eferences" })

					vim.keymap.set(
						"n",
						"gds",
						require("telescope.builtin").lsp_document_symbols,
						{ desc = "[G]oto [D]ocument [S]ymbols" }
					)

					vim.keymap.set(
						"n",
						"gws",
						require("telescope.builtin").lsp_workspace_symbols,
						{ desc = "[G]oto [W]orkspace [S]ymbols" }
					)

					vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
				end,
			})
		end,
	},
}
