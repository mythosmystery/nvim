return {
	{
		"S1M0N38/love2d.nvim",
		cmd = "LoveRun",
		opts = {},
		keys = {
			{ "<leader>v", ft = "lua", desc = "LÖVE" },
			{ "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
			{ "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
				go = { "gofmt", "goimports" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = { "isort", "ruff" },
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
			"Hoffs/omnisharp-extended-lsp.nvim",
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
		},
		config = function()
			-- Build shared capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Server configurations
			local servers = {
				ts_ls = {
					init_options = {
						preferences = {
							importModuleSpecifierPreference = "relative",
						},
					},
				},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							inlayHints = { auto = true },
							check = { command = "clippy", features = "all" },
							diagnostics = { enable = true, enableExperimental = true },
						},
					},
				},
				clangd = {},
				gopls = {},
				pyright = {},
				cssls = {},
				html = {},
				tailwindcss = {},
				svelte = {},
				templ = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { library = { vim.fn.stdpath("config") } },
						},
					},
				},
				eslint = {},
				angularls = {
					filetypes = { "typescript", "angular.html" },
				},
				omnisharp = {
					handlers = {
						["textDocument/definition"] = require("omnisharp_extended").handler,
						["textDocument/typeDefinition"] = require("omnisharp_extended").handler,
						["textDocument/references"] = require("omnisharp_extended").handler,
						["textDocument/implementation"] = require("omnisharp_extended").handler,
					},
					enable_roslyn_analyzers = true,
				},
				clojure_lsp = {},
			}

			-- Mason setup
			require("mason").setup()

			-- Install LSP servers + tools via Mason
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"eslint_d", "prettier", "stylua", "jdtls",
			})

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
			})

			-- Auto-start LSP servers via vim.lsp.config (new API - no deprecation warnings)
			for server_name, config in pairs(servers) do
				vim.lsp.config(server_name, vim.tbl_deep_extend("force", {
					capabilities = capabilities,
				}, config))
			end

			-- LspAttach: set up keymaps and inlay hints
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspAttach_keymaps", { clear = true }),
				callback = function(args)
					if not (args.data and args.data.client_id) then
						return
					end

					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					require("lsp-inlayhints").on_attach(client, bufnr)

					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions", buffer = bufnr })
					vim.keymap.set("n", "<leader>cf", require("conform").format, { desc = "[F]ormat File", buffer = bufnr })
					vim.keymap.set("n", "<leader>ch", require("lsp-inlayhints").toggle, { desc = "Toggle Inlay [H]ints", buffer = bufnr })
					vim.keymap.set("n", "<leader>cr", "<cmd>LspRestart<cr>", { desc = "[R]estart LSP", buffer = bufnr })
					vim.keymap.set("n", "<leader>cF", vim.lsp.buf.format, { desc = "[F]ormat", buffer = bufnr })
					vim.keymap.set("n", "cR", vim.lsp.buf.rename, { desc = "[R]ename", buffer = bufnr })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition", buffer = bufnr })
					vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { desc = "[G]oto Type [D]efinition", buffer = bufnr })
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation", buffer = bufnr })
					vim.keymap.set("n", "gr", function()
						require("trouble").toggle("lsp_references")
					end, { desc = "[G]oto [R]eferences", buffer = bufnr })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
				end,
			})
		end,
	},
}
