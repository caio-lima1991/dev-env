return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {},
      automatic_enable = {},
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
