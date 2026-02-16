local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
  s("litnote", {
    t({ "# ", "" }),

    t({ "", "---", "title: " }),
    t({ "", "author: " }),
    t({ "", "source: " }),
    t({ "", "tags: #type/literature " }),
    t({ "", "", "" }),

    t("# Summary"),
    t({ "", "", "# Key Points" }),
    t({ "", "", "# Connections", "" }),
  }),
  s("fnote", {
    t({ "# ", "" }),

    t({ "", "tags: " }),
    t({ "", "", "" }),

    t("# Raw Thought"),

    t({ "", "", "# Source/Context", "" }),
  }),
}

return snippets
