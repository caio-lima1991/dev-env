vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		htmlangular = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		xml = { "xmlformatter" },
		graphql = { "prettier" },
		liquid = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		java = { "google-java-format" },
		markdown = { "markdownlint-cli2" },
		sql = { "sql_formatter" },
		http = { "kulala-fmt" },
		rest = { "kulala-fmt" },
	},
	format_on_save = function()
		if vim.g.autoformat_disabled then
			return
		end
		return { lsp_fallback = true, async = false, timeout_ms = 3000 }
	end,
	formatters = { ["google-java-format"] = { prepend_args = { "--aosp" } } },
})

vim.keymap.set("n", "<leader>cF", function()
	vim.g.autoformat_disabled = not vim.g.autoformat_disabled
	vim.notify("Auto format " .. (vim.g.autoformat_disabled and "off" or "on"))
end, { desc = "Toggle auto format" })

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
