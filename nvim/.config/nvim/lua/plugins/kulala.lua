vim.pack.add({ "https://github.com/mistweaverco/kulala.nvim" })

local grammar_dir = vim.fn.stdpath("data") .. "/site/pack/core/opt/kulala.nvim/lua/tree-sitter"
local parser_dst = grammar_dir .. "/parser/kulala_http.so"

if not vim.uv.fs_stat(parser_dst) then
	vim.fn.mkdir(grammar_dir .. "/parser", "p")
	vim.system({ "tree-sitter", "build", "-o", parser_dst }, { cwd = grammar_dir }, function(r)
		vim.schedule(function()
			if r.code == 0 then
				vim.notify("kulala_http: parser built")
			else
				vim.notify("kulala_http: build failed\n" .. r.stderr, vim.log.levels.ERROR)
			end
		end)
	end)
end

require("kulala").setup()

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "http", "rest" },
	callback = function(ev)
		vim.lsp.start({
			name = "kulala-ls",
			cmd = { "kulala-ls", "--stdio" },
			root_dir = vim.fs.root(ev.buf, { ".git", "http-client.env.json" }) or vim.fn.getcwd(),
		})

		local function map(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = "Rest: " .. desc })
		end

		vim.keymap.set("n", "<leader>R", "", { desc = "+Rest" })

		map("<leader>Rc", "<cmd>lua require('kulala').copy()<cr>", "Copy as cURL")
		map("<leader>RC", "<cmd>lua require('kulala').from_curl()<cr>", "Paste from curl")

		map("<leader>Re", "<cmd>lua require('kulala').set_selected_env()<cr>", "Set environment")
		map("<leader>Ri", "<cmd>lua require('kulala').inspect()<cr>", "Inspect current request")
		map("<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", "Jump to next request")
		map("<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", "Jump to previous request")

		map("<leader>Rq", "<cmd>lua require('kulala').close()<cr>", "Close window")
		map("<leader>Rr", "<cmd>lua require('kulala').replay()<cr>", "Replay last request")
		map("<leader>Rs", "<cmd>lua require('kulala').run()<cr>", "Send the request")
		map("<leader>RS", "<cmd>lua require('kulala').show_stats()<cr>", "Show stats")
		map("<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", "Toggle headers/body")
	end,
})
