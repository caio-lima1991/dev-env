local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

local snippets = {

  s("timestamp", {
    f(function()
      return os.date("%Y%m%d%H%M%S")
    end, {}),
  }),
}

return snippets
