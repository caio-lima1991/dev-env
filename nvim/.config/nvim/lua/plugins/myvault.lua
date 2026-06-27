local fzf = require("fzf-lua")
local vault = "~/.nb/home/"

local map = vim.keymap.set

map("n", "<leader>nf", function()
	fzf.files({ cwd = vault, prompt = "Notes> " })
end, { desc = "Find Note" })

map("n", "<leader>ng", function()
	fzf.live_grep({ cwd = vault, prompt = "Grep Notes> " })
end, { desc = "Grep Notes" })

map("n", "<leader>ns", function()
	vim.fn.jobstart({ "nb", "sync" }, {
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("nb sync done", vim.log.levels.INFO)
			else
				vim.notify("nb sync failed", vim.log.levels.ERROR)
			end
		end,
	})
end, { desc = "Sync Notes (nb)" })

map("n", "<leader>na", function()
	local timestamp = os.date("%Y%m%d%H%M%S")
	local path = vim.fn.expand(vault .. timestamp .. ".md")
	vim.cmd("edit " .. vim.fn.fnameescape(path))
end, { desc = "New Note" })
