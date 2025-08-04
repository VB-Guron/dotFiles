return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				-- Your stack specific
				"lua_ls", -- Lua (Arch Linux configs)
				"ts_ls", -- TypeScript/JavaScript
				"html", -- HTML
				"cssls", -- CSS
				"tailwindcss", -- Tailwind CSS
				"emmet_ls", -- Emmet for HTML/CSS
				"pylsp", -- Python
				"omnisharp", -- C# (Unity)
				"jsonls", -- JSON
				"yamlls", -- YAML
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Formatters
				"prettier", -- JS/TS/HTML/CSS
				"stylua", -- Lua
				"black", -- Python
				"csharpier", -- C#

				-- Linters
				"eslint_d", -- JS/TS
				"pylint", -- Python
				"markdownlint", -- Markdown
			},
		})
	end,
}
