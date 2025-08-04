return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag", -- Auto-close JSX/HTML tags
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				-- Your stack specific
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"tsx",
				"jsx",
				"html",
				"css",
				"scss",
				"python",
				"c_sharp",
				"json",
				"yaml",
				"toml",
				"markdown",
				"markdown_inline",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"bash",
				"dockerfile",
			},
			autotag = { enable = true }, -- Auto-close tags for JSX/HTML
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
				},
			},
		})
	end,
}
