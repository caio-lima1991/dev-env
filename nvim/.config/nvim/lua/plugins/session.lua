vim.pack.add({ "https://github.com/rmagatti/auto-session" })
require("auto-session").setup({
    opts = {
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        session_lens = {
            picker = "select",
        },
    }
})

vim.keymap.set("n", "<leader>qr", "<cmd>AutoSession search<CR>", {desc = "Session search"} )
vim.keymap.set("n", "<leader>qs", "<cmd>AutoSession save<CR>", {desc = "Save session"} )
vim.keymap.set("n", "<leader>qa", "<cmd>AutoSession toggle<CR>", {desc = "Toggle autosave"} )
