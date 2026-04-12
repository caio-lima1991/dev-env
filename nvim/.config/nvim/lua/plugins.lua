vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

local plugins_path = vim.fn.stdpath("config") .. "/lua/plugins"
local files = vim.fn.split(vim.fn.glob(plugins_path .. "/*.lua"), "\n")

for _, file in ipairs(files) do
    if file ~= "" then
        local module_name = vim.fn.fnamemodify(file, ":t:r")
        local status, err = pcall(require, "plugins." .. module_name)
        if not status then
            vim.notify("Error loading plugin: " .. module_name .. "\n" .. err, vim.log.levels.ERROR)
        end
    end
end
