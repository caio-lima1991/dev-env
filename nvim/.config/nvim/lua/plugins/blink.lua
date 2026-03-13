return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
        end,
      },
      "folke/lazydev.nvim",
      "kristijanhusak/vim-dadbod-completion",
    },
    opts = {
      keymap = { preset = "default" },
      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { "lsp", "path", "snippets", "lazydev", "buffer", "dadbod" },
        providers = {
          lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
            score_offset = 100, -- Faz as sugestões do banco aparecerem no topo
          },
        },
      },

      snippets = { preset = "luasnip" },
      fuzzy = { implementation = "lua" },
      signature = { enabled = true },
    },
  },
}
