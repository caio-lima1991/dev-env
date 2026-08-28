vim.pack.add({ "https://github.com/mason-org/mason.nvim" })

local status_ok, mason = pcall(require, "mason")

local function ensure_installed()
	local registry = require("mason-registry")
	local packages = {
		"sqlfluff",
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
		"lemminx",
		"postgres-language-server",
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

vim.api.nvim_create_user_command("LspInstall", function()
	ensure_installed()
end, { desc = "Install lsp dependencies" })

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
