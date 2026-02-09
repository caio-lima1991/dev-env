return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "ts_ls@5.1.3",
        "html@4.10.0",
        "cssls@4.10.0",
        "lua_ls@3.15.0",
        "pyright@1.1.407",
        "eslint@4.10.0",
        "jdtls@v1.56.0",
        "angularls@21.0.6",
        "bashls@5.6.0",
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
