vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/nvim-neotest/nvim-nio",
})

local dap = require("dap")
local dapui = require("dapui")

local function get_args(config)
  local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
  local args_str = type(args) == "table" and table.concat(args, " ") or args

  config = vim.deepcopy(config)
  config.args = function()
    local new_args = vim.fn.expand(vim.fn.input("Run with args: ", args_str))
    if config.type and config.type == "java" then
      return new_args
    end
    return require("dap.utils").splitstr(new_args)

  end

  return config
end


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
        { id = "repl", size = 0.5 },
        { id = "console", size = 0.5 },
      },
      position = "bottom",
      size = 20,

    },
  },
})

vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

local map = vim.keymap.set

map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Breakpoint Condition" })
map("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function() dap.continue() end, { desc = "Run/Continue" })
map("n", "<leader>da", function() dap.continue({ before = get_args }) end, { desc = "Run with Args" })
map("n", "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run to Cursor" })
map("n", "<leader>dg", function() dap.goto_() end, { desc = "Go to Line (No Execute)" })
map("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })

map("n", "<leader>dj", function() dap.down() end, { desc = "Down" })

map("n", "<leader>dk", function() dap.up() end, { desc = "Up" })
map("n", "<leader>dl", function() dap.run_last() end, { desc = "Run Last" })
map("n", "<leader>do", function() dap.step_out() end, { desc = "Step Out" })

map("n", "<leader>dO", function() dap.step_over() end, { desc = "Step Over" })
map("n", "<leader>dP", function() dap.pause() end, { desc = "Pause" })

map("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL" })
map("n", "<leader>ds", function() dap.session() end, { desc = "Session" })

map("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })
map("n", "<leader>dw", function() require("dap.ui.widgets").hover() end, { desc = "Widgets" })

map("n", "<leader>du", function() dapui.toggle({}) end, { desc = "Dap UI" })
map({ "n", "x" }, "<leader>de", function() dapui.eval() end, { desc = "Eval" })

-- F-Keys (VS Code style)
map("n", "<F5>", function() dap.continue() end, { desc = "DAP: Continue" })
map("n", "<F10>", function() dap.step_over() end, { desc = "DAP: Step Over" })
map("n", "<F11>", function() dap.step_into() end, { desc = "DAP: Step Into" })
map("n", "<F12>", function() dap.step_out() end, { desc = "DAP: Step Out" })
map("n", "<F9>", function() dap.toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
