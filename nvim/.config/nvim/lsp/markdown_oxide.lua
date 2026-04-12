local function command_factory(client, bufnr, cmd)
    client.request("workspace/executeCommand", {
        command = "jump",
        arguments = { cmd },
    }, function(err, result)
        if err then
            vim.notify("Markdown-Oxide error: " .. err.message, vim.log.levels.ERROR)
        end
    end, bufnr)
end

return {
    root_markers = { ".git", ".obsidian", ".moxide.toml" },
    filetypes = { "markdown" },
    cmd = { "markdown-oxide" },
    capabilities = (function()
        local caps = vim.lsp.protocol.make_client_capabilities()
        caps.textDocument.completion.completionItem.snippetSupport = true
        return caps
    end)(),
    on_attach = function(client, bufnr)
        for _, cmd in ipairs({ "today", "tomorrow", "yesterday" }) do
            local cmd_name = "Lsp" .. cmd:gsub("^%l", string.upper)
            vim.api.nvim_buf_create_user_command(bufnr, cmd_name, function()
                command_factory(client, bufnr, cmd)
            end, {

                desc = ("Open %s daily note"):format(cmd),
            })
        end

        if client.commands then
            client.commands["jump"] = function(command, ctx)
                local arg = command.arguments[1]
                command_factory(client, ctx.bufnr, arg)
            end
        end
    end,
}
