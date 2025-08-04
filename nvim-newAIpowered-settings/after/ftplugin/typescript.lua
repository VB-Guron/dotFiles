-- Include JavaScript settings
vim.cmd("runtime! after/ftplugin/javascript.lua")

local set = vim.opt_local

-- TypeScript specific enhancements
vim.keymap.set(
	"n",
	"<leader>ti",
	": // TODO: add proper type<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>",
	{ buffer = true, desc = "Insert interface" }
)
vim.keymap.set(
	"n",
	"<leader>tt",
	": // TODO: add proper type<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>",
	{ buffer = true, desc = "Insert type annotation" }
)
