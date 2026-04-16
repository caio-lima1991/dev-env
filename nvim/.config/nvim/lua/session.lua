local session_dir = vim.fn.stdpath("data") .. "/sessions"

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

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        local session_file = get_session_file()
        vim.cmd("mksession! " .. session_file)
    end
})
