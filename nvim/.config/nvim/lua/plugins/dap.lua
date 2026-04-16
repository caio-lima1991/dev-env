vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
})

local dap_loaded = false
local dap_group = vim.api.nvim_create_augroup("LazyDap", { clear = true })

function CONFIG_DAP()
	if dap_loaded then
		print("DAP already loaded")
		return
	end

	local dap = require("dap")
	local dapui = require("dapui")

	dapui.setup({
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.25 },
					{ id = "breakpoints", size = 0.25 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 0.25 },
				},
				position = "left",
				size = 50,
			},
			{
				elements = {
					{ id = "repl", size = 0.35 },
					{ id = "console", size = 0.65 },
				},
				position = "bottom",
				size = 30,
			},
		},
	})

	vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	local map = vim.keymap.set
	map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
	map("n", "<leader>dc", dap.continue, { desc = "Run/Continue" })
	map("n", "<leader>di", dap.step_into, { desc = "Step Into" })
	map("n", "<leader>do", dap.step_out, { desc = "Step Out" })
	map("n", "<leader>dO", dap.step_over, { desc = "Step Over" })
	map("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
	map("n", "<leader>du", dapui.toggle, { desc = "Dap UI" })

	map("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
	map("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
	map("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
	map("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
	map("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })

	dap_loaded = true
	print("DAP Environment Loaded")
end

vim.api.nvim_create_user_command("DebugStart", function()
	CONFIG_DAP()
end, { desc = "Start dap without lsp attached" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = dap_group,
	once = true,
	callback = function()
		CONFIG_DAP()
	end,
})
