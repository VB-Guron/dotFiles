local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Core plugins
	{ import = "Von.plugins" },
	{ import = "Von.plugins.lsp" },

	-- UI plugins
	{ import = "Von.plugins.ui" },

	-- Editor plugins
	{ import = "Von.plugins.editor" },

	-- Git plugins
	{ import = "Von.plugins.git" },

	-- Development specific
	{ import = "Von.plugins.dev" },

	-- Utilities
	{ import = "Von.plugins.utils" },
}, {
	-- Lazy.nvim configuration
	defaults = {
		lazy = false,
		version = false, -- Try to load latest stable versions
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		border = "rounded",
	},
})
