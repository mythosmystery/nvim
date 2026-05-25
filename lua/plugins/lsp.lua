return {
	-- Mason 2.0 — LSP/formatter package manager
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				-- LSP servers
				"typescript-language-server",
				"pyright",
				"gopls",
				"lua-language-server",
				"clojure-lsp",
				"css-lsp",
				"html-lsp",
				"tailwindcss-language-server",
				"eslint-lsp",
				-- Formatters
				"stylua",
				"prettier",
				"eslint_d",
				"goimports",
				"isort",
				"ruff",
			},
		},
	},

	-- LSP progress notifications
	{
		"j-hui/fidget.nvim",
		opts = {},
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
				go = { "goimports", "gofmt" },
				python = { "isort", "ruff" },
			},
		},
	},

	-- Completion engine (replaces nvim-cmp stack)
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "select_and_accept", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<C-l>"] = { "snippet_forward", "fallback" },
				["<C-h>"] = { "snippet_backward", "fallback" },
			},
			snippets = { preset = "default" },
			sources = {
				default = { "lsp", "snippets", "buffer", "path" },
			},
		},
	},

	-- LSP config presets + server setup + keymaps
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				init_options = {
					preferences = { importModuleSpecifierPreference = "relative" },
				},
			})
			vim.lsp.config("pyright", { capabilities = capabilities })
			vim.lsp.config("gopls", { capabilities = capabilities })
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { library = { vim.fn.stdpath("config") } },
					},
				},
			})
			vim.lsp.config("clojure_lsp", { capabilities = capabilities })
			vim.lsp.config("cssls", { capabilities = capabilities })
			vim.lsp.config("html", { capabilities = capabilities })
			vim.lsp.config("tailwindcss", { capabilities = capabilities })
			vim.lsp.config("eslint", { capabilities = capabilities })

			vim.lsp.enable({
				"ts_ls",
				"pyright",
				"gopls",
				"lua_ls",
				"clojure_lsp",
				"cssls",
				"html",
				"tailwindcss",
				"eslint",
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspAttach_keymaps", { clear = true }),
				callback = function(args)
					if not (args.data and args.data.client_id) then
						return
					end

					local bufnr = args.buf

					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions", buffer = bufnr })
					vim.keymap.set("n", "<leader>cf", require("conform").format, { desc = "[F]ormat File", buffer = bufnr })
					vim.keymap.set("n", "<leader>ch", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
					end, { desc = "Toggle Inlay [H]ints", buffer = bufnr })
					vim.keymap.set("n", "<leader>cr", "<cmd>LspRestart<cr>", { desc = "[R]estart LSP", buffer = bufnr })
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
