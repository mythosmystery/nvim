return {
	{
		"LhKipp/nvim-nu",
		ft = "nu",
		opts = {
			use_lsp_features = true,
		},
	},
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
				go = { "gofmt", "goimports" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"lvimuser/lsp-inlayhints.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer",
			"folke/neodev.nvim",
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
		},
		config = function()
			local servers = {
				tsserver = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							inlayHints = {
								auto = true,
							},
							check = {
								command = "clippy",
							},
						},
					},
				},
				clangd = {},
				gopls = {},
				elixirls = {},
				vuels = {},
				pyright = {},
				cssls = {},
				html = {},
				tailwindcss = {},
				svelte = {},
				templ = {},
				lua_ls = {},
				eslint = {},
				dockerls = {},
				docker_compose_language_service = {},
			}

			require("neodev").setup()

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"eslint_d",
				"prettier",
				"stylua",
			})

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
			})

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})

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
