return {
	-- Tailwind support
	"roobert/tailwindcss-colorizer-cmp.nvim",
	{
		"NvChad/nvim-colorizer.lua",
		ft = { "html", "css", "scss", "javascript", "typescript", "jsx", "tsx" },
		opts = {
			user_default_options = { tailwind = true },
		},
	},
	-- Emmet for HTML/CSS
	{
		"olrtg/nvim-emmet",
		ft = { "html", "css", "scss", "javascript", "typescript", "jsx", "tsx" },
		config = function()
			vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
		end,
	},
	-- Auto pairs for JSX/TSX
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
					typescript = { "template_string" },
				},
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
