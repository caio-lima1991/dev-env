vim.pack.add({ "https://github.com/obsidian-nvim/obsidian.nvim" })

require("obsidian").setup({
    legacy_commands = false,
    workspaces = {
        {
            name = "personal",
            path = "~/myvault/",
        },
    },
})
