return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		styles = {
			input = {
				keys = {
					n_esc = { "<C-c>", { "cmp_close", "cancel" }, mode = "n", expr = true },
					i_esc = { "<C-c>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
				},
			},
		},
		input = { enabled = true },
		quickfile = {
			enabled = true,
			exclude = { "latex" },
		},
		picker = {
			enabled = true,
			layout = {
				preset = "telescope",
				cycle = false,
			},
		},
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
	keys = {
		{
			"<leader>lg",
			function()
				require("snacks").lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>rN",
			function()
				require("snacks").rename.rename_file()
			end,
			desc = "Fast Rename Current File",
		},
		{
			"<leader>dB",
			function()
				require("snacks").bufdelete()
			end,
			desc = "Delete Buffer",
		},

		-- Snacks Picker
		{
			"<leader>pf",
			function()
				require("snacks").picker.files()
			end,
			desc = "Find Files (Snacks)",
		},
		{
			"<leader>pc",
			function()
				require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ps",
			function()
				require("snacks").picker.grep()
			end,
			desc = "Grep word",
		},
		{
			"<leader>pk",
			function()
				require("snacks").picker.keymaps()
			end,
			desc = "Search Keymaps",
		},

		-- Git
		{
			"<leader>gbr",
			function()
				require("snacks").picker.git_branches()
			end,
			desc = "Git Branches",
		},

		-- Utils
		{
			"<leader>th",
			function()
				require("snacks").picker.colorschemes()
			end,
			desc = "Color Schemes",
		},
		{
			"<leader>vh",
			function()
				require("snacks").picker.help()
			end,
			desc = "Help Pages",
		},
	},
}
