vim.pack.add({ "https://github.com/mason-org/mason.nvim" }) 

local status_ok, mason = pcall(require, "mason")
if status_ok then
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })
end
