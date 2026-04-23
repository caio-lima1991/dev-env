local session_dir = vim.fn.stdpath("data") .. "/sessions"
local session_active = false

vim.fn.mkdir(session_dir, "p")

local function get_session_file()
	local cwd = vim.fn.getcwd()
	local safe_name = cwd:gsub("/", "_"):gsub("^_", "")
	return session_dir .. "/" .. safe_name .. ".vim"
end

vim.keymap.set("n", "<leader>qs", function()
	local session_file = get_session_file()
	vim.cmd("mksession! " .. session_file)
	vim.notify("Session saved: " .. session_file)
end, { desc = "Save session for current folder" })

vim.keymap.set("n", "<leader>qr", function()
	local session_file = get_session_file()
	if vim.fn.filereadable(session_file) == 1 then
		vim.cmd("source " .. session_file)
		vim.notify("Session restored: " .. session_file)
	else
		vim.notify("No session found for: " .. session_file, vim.log.levels.WARN)
	end
end, { desc = "Restore session for current folder" })

vim.api.nvim_create_autocmd("VimEnter", {
	nested = true,
	callback = function()
		if vim.fn.argc() > 0 then
			return
		end
		local session_file = get_session_file()
		if vim.fn.filereadable(session_file) == 1 then
			vim.cmd("source " .. session_file)
			session_active = true
			vim.notify("Session restored: " .. session_file)
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		require("dapui").close()
		if not session_active then
			return
		end
		local bufs = vim.tbl_filter(function(b)
			return vim.api.nvim_buf_is_loaded(b) and vim.api.nvim_buf_get_name(b) ~= ""
		end, vim.api.nvim_list_bufs())
		if #bufs == 0 then
			return
		end
		vim.cmd("mksession! " .. get_session_file())
	end,
})
