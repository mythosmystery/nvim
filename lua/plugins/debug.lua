return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
		"theHamsta/nvim-dap-virtual-text",
		{
			"microsoft/vscode-js-debug",
			version = "1.x",
			build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
		},
	},
	config = function()
		require("dap-vscode-js").setup({
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})

		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")

		dap.adapters.lldb = {
			type = "executable",
			-- command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
			command = "/home/linuxbrew/.linuxbrew/bin/lldb-dap",
			name = "lldb",
		}

		for _, lang in ipairs({ "javascript", "typescript" }) do
			dap.configurations[lang] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					name = "Launch Server",
					type = "pwa-node",
					request = "launch",
					runtimeExecutable = "${workspaceFolder}/node_modules/.bin/ts-node",
					runtimeArgs = {
						"${workspaceFolder}/src/main.ts",
					},
					cwd = "${workspaceFolder}",
					skipFiles = { "<node_internals>/**", "node_modules/**" },
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

		dap.configurations.c = {
			{
				name = "Make and Launch",
				type = "lldb",
				request = "launch",
				program = function()
					local cwd = vim.fn.getcwd()
					local result = vim.fn.system("make debug 2>&1")

					if vim.v.shell_error ~= 0 then
						print("Error:", result)
						return nil
					else
						local path = cwd .. "/main"
						local file = io.open(path, "r")
						if file == nil then
							print("No executable found")
							return vim.fn.input("Path to executable: ")
						end
						file:close()
						return path
					end
				end,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Launch from Path",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = true,
			},
		}

		dap.configurations.cpp = dap.configurations.c

		dap.configurations.rust = {
			{
				type = "lldb",
				request = "launch",
				name = "Launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				initCommands = function()
					-- Find out where to look for the pretty printer Python module
					local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

					local script_import = 'command script import "'
						.. rustc_sysroot
						.. '/lib/rustlib/etc/lldb_lookup.py"'
					local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

					local commands = {}
					local file = io.open(commands_file, "r")
					if file then
						for line in file:lines() do
							table.insert(commands, line)
						end
						file:close()
					end
					table.insert(commands, 1, script_import)

					return commands
				end,
			},
		}

		require("nvim-dap-virtual-text").setup({})

		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "stacks", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{ id = "repl", size = 1 },
					},
					position = "bottom",
					size = 10,
				},
			},
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "Toggle [B]reakpoint" })
		vim.keymap.set("n", "<leader>dc", require("dap").continue, { desc = "[C]ontinue" })
		vim.keymap.set("n", "<leader>ds", require("dap").step_over, { desc = "[S]tep Over" })
		vim.keymap.set("n", "<leader>di", require("dap").step_into, { desc = "Step [I]nto" })
		vim.keymap.set("n", "<leader>do", require("dap").step_out, { desc = "Step [O]ut" })
		vim.keymap.set("n", "<leader>dw", require("dapui").elements.watches.add, { desc = "[W]atch" })
		vim.keymap.set("n", "<leader>dr", require("dapui").elements.watches.remove, { desc = "[R]emove Watch" })
		vim.keymap.set("n", "<leader>dx", function()
			require("dap").disconnect()
			require("dap").close()
			require("dapui").close()
		end, { desc = "E[x]it" })
	end,
}
