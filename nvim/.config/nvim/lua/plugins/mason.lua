vim.pack.add({ "https://github.com/mason-org/mason.nvim" })

local function ensure_installed()
	local registry = require("mason-registry")
	local packages = {
		"sql-formatter",
		"black",
		"isort",
		"google-java-format",
		"prettier",
		"xmlformatter",
		"angular-language-server",
		"bash-language-server",
		"css-lsp",
		"html-lsp",
		"java-debug-adapter",
		"jdtls",
		"lua-language-server",
		"markdownlint-cli2",
		"pyright",
		"stylua",
		"typescript-language-server",
		"marksman",
	}

	registry.refresh(function()
		for _, name in ipairs(packages) do
			if registry.has_package(name) then
				local p = registry.get_package(name)
				if not p:is_installed() then
					print("Mason: Installing " .. name)
					p:install()
				end
			else
				print("Mason: Package not found: " .. name)
			end
		end
	end)
end

local function setup_mason()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
end

vim.api.nvim_create_user_command("Mason", function()
	setup_mason()
	vim.cmd("Mason")
end, { desc = "Abrir Mason UI" })

vim.api.nvim_create_user_command("LspInstall", function()
	setup_mason()
	ensure_installed()
end, { desc = "Instalar dependências LSP" })
