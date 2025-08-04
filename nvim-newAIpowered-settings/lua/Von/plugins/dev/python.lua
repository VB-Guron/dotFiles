return {
	-- Python-specific tools
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		ft = "python",
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python venv" },
		},
		config = function()
			require("venv-selector").setup({
				auto_refresh = true,
				search_venv_managers = true,
				search_workspace = true,
			})
		end,
	},
}
