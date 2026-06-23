local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local snippets = {

    s("note", {
        t({ "---", "" }),
        t('id: "'),
        f(function() return vim.fn.expand("%:t:r") end, {}),
        t({ '"', "aliases:", "  - " }),
        i(1, "Title"),
        t({ "", "tags:", "  - " }),
        i(2, "#tag"),
        t({ "", "---", "", "" }),
    }),


    s("litnote", {
        t({ "---", "" }),
        t("id: "),
        f(function() return vim.fn.expand("%:t:r") end, {}),
        t({ "", "aliases:", "  - " }),
        i(1, "Title"),
        t({ "", "tags: []", "---", "", "" }),
        t({ "# Summary", "", "" }),
        t({ "# Key Points", "", "" }),
        t({ "# Connections", "" }),
    }),

    s("fnote", {
        t({ "---", "" }),
        t("id: "),
        f(function() return vim.fn.expand("%:t:r") end, {}),
        t({ "", "aliases:", "  - " }),
        i(1, "Title"),
        t({ "", "tags: []", "---", "", "" }),
        t({ "# Raw Thought", "", "" }),
        t({ "# Source/Context", "" }),
    }),
}

return snippets
