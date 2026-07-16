vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local map = vim.keymap.set

-- Keymaps via comando (não carregam fzf-lua no startup)
map("n", "<leader>,", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", { desc = "Switch Buffer" })
map("n", "<leader>/", "<cmd>FzfLua live_grep formatter=path.filename_first<cr>", { desc = "Grep (Root Dir)" })
map("n", "<leader>:", "<cmd>FzfLua command_history<cr>", { desc = "Command History" })
map("n", "<leader><space>", "<cmd>FzfLua files<cr>", { desc = "Find Files (Root Dir)" })

map("n", "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", { desc = "Buffers" })
map("n", "<leader>fB", "<cmd>FzfLua buffers<cr>", { desc = "Buffers (all)" })
map("n", "<leader>fc", "<cmd>FzfLua files root=false cwd=~/.config/nvim<cr>", { desc = "Find Config File" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files (Root Dir)" })
map("n", "<leader>fF", "<cmd>FzfLua files root=false<cr>", { desc = "Find Files (cwd)" })
map("n", "<leader>fg", "<cmd>FzfLua git_files<cr>", { desc = "Find Files (git-files)" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent" })
map("n", "<leader>fR", function()
	require("fzf-lua").oldfiles({ cwd = vim.uv.cwd() })
end, { desc = "Recent (cwd)" })

map("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Commits" })
map("n", "<leader>gd", "<cmd>FzfLua git_diff<cr>", { desc = "Git Diff (hunks)" })
map("n", "<leader>gb", "<cmd>FzfLua git_bcommits<CR>", { desc = "Buffer Commits" })
map("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Status" })
map("n", "<leader>gS", "<cmd>FzfLua git_stash<cr>", { desc = "Git Stash" })

map("n", '<leader>s"', "<cmd>FzfLua registers<cr>", { desc = "Registers" })
map("n", "<leader>s/", "<cmd>FzfLua search_history<cr>", { desc = "Search History" })
map("n", "<leader>sa", "<cmd>FzfLua autocmds<cr>", { desc = "Auto Commands" })
map("n", "<leader>sb", "<cmd>FzfLua lines<cr>", { desc = "Buffer Lines" })
map("n", "<leader>sc", "<cmd>FzfLua command_history<cr>", { desc = "Command History" })
map("n", "<leader>sC", "<cmd>FzfLua commands<cr>", { desc = "Commands" })
map("n", "<leader>sd", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Diagnostics" })
map("n", "<leader>sD", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>sg", "<cmd>FzfLua live_grep formatter=path.filename_first<cr>", { desc = "Grep (Root Dir)" })
map("n", "<leader>sG", "<cmd>FzfLua live_grep_native root=false<cr>", { desc = "Grep (cwd)" })
map("n", "<leader>sh", "<cmd>FzfLua help_tags<cr>", { desc = "Help Pages" })
map("n", "<leader>sH", "<cmd>FzfLua highlights<cr>", { desc = "Search Highlight Groups" })
map("n", "<leader>sj", "<cmd>FzfLua jumps<cr>", { desc = "Jumplist" })
map("n", "<leader>sk", "<cmd>FzfLua keymaps<cr>", { desc = "Key Maps" })
map("n", "<leader>sl", "<cmd>FzfLua loclist<cr>", { desc = "Location List" })
map("n", "<leader>sM", "<cmd>FzfLua man_pages<cr>", { desc = "Man Pages" })
map("n", "<leader>sm", "<cmd>FzfLua marks<cr>", { desc = "Jump to Mark" })
map("n", "<leader>sR", "<cmd>FzfLua resume<cr>", { desc = "Resume" })
map("n", "<leader>sq", "<cmd>FzfLua quickfix<cr>", { desc = "Quickfix List" })
map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Word (Root Dir)" })
map("n", "<leader>sW", "<cmd>FzfLua grep_cword root=false<cr>", { desc = "Word (cwd)" })

map("x", "<leader>sw", "<cmd>FzfLua grep_visual<cr>", { desc = "Selection (Root Dir)" })
map("x", "<leader>sW", "<cmd>FzfLua grep_visual root=false<cr>", { desc = "Selection (cwd)" })

map("n", "<leader>sX", function()
	require("fzf-lua").diagnostics_workspace({ severity_only = vim.diagnostic.severity.ERROR })
end, { desc = "Search Diagnostic Errors" })

map("n", "<leader>ss", function()
	require("fzf-lua").lsp_document_symbols({})
end, { desc = "Goto Symbol" })

map("n", "<leader>sS", function()
	require("fzf-lua").lsp_live_workspace_symbols({})
end, { desc = "Goto Symbol (Workspace)" })

map("n", "gd", "<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>", { desc = "Goto Definition" })
map("n", "grr", "<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<cr>", { desc = "References" })
map("n", "gri", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", { desc = "Goto Implementation" })
map("n", "gy", "<cmd>FzfLua lsp_typedefs jump1=true ignore_current_line=true<cr>", { desc = "Goto T[y]pe Definition" })

-- Setup adiado para não bloquear o startup
vim.schedule(function()
	local fzf = require("fzf-lua")
	fzf.setup({
		defaults = {
			formatter = "path.filename_first",
		},
		files = {
			cwd_prompt = false,
		},
		lsp = {
			code_actions = {
				previewer = false,
			},
		},
		file_ignore_patterns = { "node_modules/", "dist/", ".git/", "target/", ".svn/", "%.ignore" },
	})
	fzf.register_ui_select()
	fzf.config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
end)
