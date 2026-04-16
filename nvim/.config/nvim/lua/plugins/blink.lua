local blink_group = vim.api.nvim_create_augroup("LazyBlink", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	group = blink_group,
	callback = function()
		vim.pack.add({
			"https://github.com/saghen/blink.cmp",
			"https://github.com/L3MON4D3/LuaSnip",
			"https://github.com/rafamadriz/friendly-snippets",
			"https://github.com/kristijanhusak/vim-dadbod-completion",
		})

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
		require("blink.cmp").setup({
			keymap = { preset = "default" },

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer", "dadbod" },

				providers = {
					dadbod = {
						name = "Dadbod",
						module = "vim_dadbod_completion.blink",
						score_offset = 100,
					},
				},
			},

			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "lua" },
			signature = { enabled = true },
		})
		vim.api.nvim_del_augroup_by_id(blink_group)
	end,
})
