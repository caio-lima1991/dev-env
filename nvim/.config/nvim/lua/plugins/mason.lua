return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "lua_ls",
        "pyright",
        "eslint",
        "jdtls",
        "angularls",
        "bashls",
        "markdown_oxide",
      },
      automatic_enable = {
        exclude = {
          "jdtls",
        },
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        event = "VeryLazy",
        cmd = "Mason",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
}
