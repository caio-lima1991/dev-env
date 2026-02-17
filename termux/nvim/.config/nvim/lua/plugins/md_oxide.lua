return {
  {
    "neovim/nvim-lspconfig",

    init = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_blink, blink = pcall(require, "blink.cmp")
      if has_blink then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      if not capabilities.workspace then
        capabilities.workspace = {}
      end
      capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = true }

      vim.lsp.config("markdown_oxide", {
        cmd = { "markdown-oxide" },
        filetypes = { "markdown" },
        root_markers = { ".obsidian", ".git", "index.md" },
        capabilities = capabilities,
      })

      vim.lsp.enable("markdown_oxide")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          -- Type Guard to stop the "param-type-mismatch" errors
          if not client or client.name ~= "markdown_oxide" then
            return
          end

          local opts = { buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          vim.api.nvim_buf_create_user_command(bufnr, "Daily", function(cmd_args)
            client:request("workspace/executeCommand", {
              command = "jump",
              arguments = { cmd_args.args },
            }, function(err)
              if err then
                vim.notify("Oxide Error: " .. err.message, vim.log.levels.ERROR)
              end
            end, bufnr)
          end, { desc = "Open daily note", nargs = "*" })
        end,
      })
    end,
  },
}
