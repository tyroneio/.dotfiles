return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			dap.adapters["local-lua"] = {
				type = "executable",
				command = "local-lua-dbg",
				enrich_config = function(config, on_config)
					if not config["extensionPath"] then
						local c = vim.deepcopy(config)
						c.extensionPath = "/usr/lib/node_modules/local-lua-debugger-vscode"
						on_config(c)
					else
						on_config(config)
					end
				end,
			}
			dap.configurations.lua = {
				{
					name = "Current file (local-lua-dbg, lua)",
					type = "local-lua",
					repl_lang = "lua",
					request = "launch",
					cwd = "${workspaceFolder}",
					program = {
						lua = "luajit",
						file = "${file}",
					},
					args = {},
				},
				{
					name = "Current file (local-lua-dbg, neovim lua interpreter with nlua)",
					type = "local-lua",
					repl_lang = "lua",
					request = "launch",
					cwd = "${workspaceFolder}",
					program = {
						lua = "nlua",
						file = "${file}",
					},
					args = {},
				},
			}

			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

			-- Eval var under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<F1>", dap.continue)
			vim.keymap.set("n", "<F2>", dap.step_into)
			vim.keymap.set("n", "<F3>", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<F13>", dap.restart)

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
