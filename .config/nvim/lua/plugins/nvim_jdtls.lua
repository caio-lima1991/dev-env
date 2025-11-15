return {
  { "mfussenegger/nvim-jdtls" },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }

      require("mason-nvim-dap").setup({
        ensure_installed = { "javadbg" },
      })
    end,
    dependencies = {
      {
        "mason-org/mason.nvim",
      },
    },
  },
}
