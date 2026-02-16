vim.g.mapleader = " "
vim.opt.clipboard:append("unnamedplus")
vim.opt.termguicolors = true

if vim.g.vscode then
  vim.g.clipboard = "win32yank"
  vim.keymap.set(
    "n",
    "gri",
    "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>",
    { desc = "Go to Implementation" }
  )
  vim.keymap.set(
    "n",
    "grd",
    "<Cmd>call VSCodeNotify('editor.action.goToDefinition')<CR>",
    { desc = "Go to Definition" }
  )
else
  -- Fast WSL Clipboard Configuration
  if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
      name = "win32yank-wsl",
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
      },
      cache_enabled = 0,
    }
  end

  -- Neovim only
  require("config.lazy")
  require("init")
end
