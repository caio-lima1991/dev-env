vim.pack.add({ "https://github.com/L3MON4D3/LuaSnip", "https://github.com/rafamadriz/friendly-snippets" })

local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set({ "i", "s" }, "<Tab>", function()
    if vim.fn.pumvisible() == 1 then
        return "<C-n>"
    elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
    else
        return "<Tab>"
    end
end, { expr = true })
