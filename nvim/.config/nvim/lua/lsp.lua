local lsp_path = vim.fn.stdpath("config") .. "/lsp"
local files = vim.split(vim.fn.glob(lsp_path .. "/*.lua"), "\n")

for _, file in ipairs(files) do
    if file ~= "" then
        local server_name = vim.fn.fnamemodify(file, ":t:r")
        vim.lsp.enable(server_name)
    end
end
