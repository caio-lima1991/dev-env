return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      preset = "helix",
      delay = 0,
      spec = {
        { "<leader>u", group = "Undotree", mode = { "n" } },
        {
          mode = { "n", "x" },
          { "<leader>c",  group = "code" },
          { "<leader>d",  group = "debug" },
          { "<leader>f",  group = "file/find" },
          { "<leader>g",  group = "git" },
          { "<leader>gh", group = "hunks" },
          { "<leader>q",  group = "quit/session" },
          { "<leader>s",  group = "search" },
          { "<leader>x",  group = "dagnostics/quickfix" },
          { "[",          group = "prev" },
          { "]",          group = "next" },
          { "g",          group = "goto" },
          { "gs",         group = "surround" },
          { "z",          group = "fold" },
          { "gx",         desc = "Open with system app" },

          {
            "<leader>b",
            group = "buffer",
            expand = function()
              return require("which-key.extras").expand.buf()
            end,
          },
          {
            "<leader>w",
            group = "windows",
            proxy = "<c-w>",
            expand = function()
              return require("which-key.extras").expand.win()
            end,
          },
        }
      },
    },
  },
}
