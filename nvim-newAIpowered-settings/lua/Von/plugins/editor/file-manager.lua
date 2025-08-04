return {
	-- Mini.files as primary file explorer
	{
		"echasnovski/mini.files",
		config = function()
			local MiniFiles = require("mini.files")
			MiniFiles.setup({
				mappings = {
					go_in = "<CR>",
					go_in_plus = "L",
					go_out = "-",
					go_out_plus = "H",
				},
			})
			vim.keymap.set("n", "<leader>ee", function()
				MiniFiles.open()
			end, { desc = "File explorer" })
			vim.keymap.set("n", "<leader>ef", function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				MiniFiles.reveal_cwd()
			end, { desc = "File explorer (current file)" })
		end,
	},
	-- Add Yazi from backup as secondary option
	{
		"mikavilpas/yazi.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ey",
				function()
					require("yazi").yazi()
				end,
				desc = "Yazi file manager",
			},
		},
		opts = {
			floating_window_scaling_factor = 0.9,
			keymaps = {
				open_file_in_vertical_split = "<c-v>",
				open_file_in_horizontal_split = "<c-x>",
				open_file_in_tab = "<c-t>",
			},
		},
	},
}
