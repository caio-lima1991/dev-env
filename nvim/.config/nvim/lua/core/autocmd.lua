local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local lsp_group = augroup("UserLspConfig", { clear = true })

autocmd("LspAttach", {
  group = lsp_group,
  callback = function(ev)
    local opts = { buffer = ev.buf, remap = false }
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "LSP: [C]ode [A]ction" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "LSP: [G]oto [D]efinition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP: Hover Documentation" })
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP: [R]e[n]ame" })
    vim.keymap.set("n", "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = ev.buf, desc = "LSP: [F]ormat buffer" })
  end,
})
