return {
	-- C# support for Unity development
	{
		"iabdelkareem/csharp.nvim",
		ft = "cs",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			"Tastyep/structlog.nvim",
		},
		config = function()
			require("csharp").setup({
				lsp = {
					enable = true,
					cmd_path = "omnisharp",
				},
				dap = {
					enable = true,
				},
			})
		end,
	},
}
