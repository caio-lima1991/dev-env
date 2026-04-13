local session_dir = vim.fn.stdpath("data") .. "/sessions"

vim.fn.mkdir(session_dir, "p")

local function get_session_file()
    local cwd = vim.fn.getcwd()
    local safe_name = cwd:gsub("/", "_"):gsub("^_", "")
    return session_dir .. "/" .. safe_name .. ".vim"
end

local function list_sessions()
    local sessions = vim.fn.glob(session_dir .. "/*.vim", false, true)
    if #sessions == 0 then
        vim.notify("No sessions found", vim.log.levels.INFO)
        return
    end

    local items = {}
    for _, session_file in ipairs(sessions) do
        local basename = vim.fn.fnamemodify(session_file, ":t:r")
        local path = basename:gsub("^_", ""):gsub("_", "/")
        table.insert(items, {
            display = path,
            path = session_file,
        })
    end

    table.sort(items, function(a, b)
        return a.display < b.display
    end)

    vim.ui.select(items, {
        prompt = "Select session to restore: ",
        format_item = function(item)
            return item.display
        end,
    }, function(choice)
        if choice then
            vim.cmd("source " .. choice.path)
            vim.notify("Session restored: " .. choice.display)
        end
    end)
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

vim.keymap.set("n", "<leader>ql", function()
    list_sessions()
end, { desc = "List and restore any session" })
