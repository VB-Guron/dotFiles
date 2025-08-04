return {
	-- Keep your current rose-pine as primary
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				dim_inactive_windows = false,
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
				highlight_groups = {
					ColorColumn = { bg = "#1C1C21" },
					Normal = { bg = "none" },
					Pmenu = { bg = "", fg = "#e0def4" },
					PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" },
					PmenuSbar = { bg = "#191724" },
					PmenuThumb = { bg = "#9ccfd8" },
				},
				enable = {
					terminal = false,
					legacy_highlights = false,
					migrations = true,
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},
	-- Add Catppuccin from backup
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				integrations = {
					telescope = { enabled = true },
					harpoon = true,
					mason = true,
					cmp = true,
					gitsigns = true,
					treesitter = true,
					mini = { enabled = true },
				},
			})
		end,
	},
	-- Keep your other themes
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
				overrides = {
					Pmenu = { bg = "" },
				},
			})
		end,
	},
}
