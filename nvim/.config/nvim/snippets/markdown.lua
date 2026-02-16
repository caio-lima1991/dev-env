local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
  s("litnote", {
    t({ "---", "title: " }),
    t({ "", "author: " }),
    t({ "", "source: " }),
    t({ "", "tags: #type/literature " }),
    t({ "", "---", "", "" }),

    t("# Summary"),
    t({ "", "", "# Connections", "" }),
  }),
}

return snippets
