return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = true,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown" },
	opts = {
		heading = {
			sign = false,
			icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
		},
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		bullet = {
			enabled = true,
		},
		checkbox = {
			enabled = true,
			position = "inline",
			unchecked = {
				icon = "   󰄱 ",
				highlight = "RenderMarkdownUnchecked",
			},
			checked = {
				icon = "   󰱒 ",
				highlight = "RenderMarkdownChecked",
			},
		},
	},
}
