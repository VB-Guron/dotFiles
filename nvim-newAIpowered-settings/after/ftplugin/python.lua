local set = vim.opt_local

-- Python specific settings
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.textwidth = 88 -- Black formatter standard

-- Python-specific keymaps
vim.keymap.set("n", "<leader>py", "print()<Left>", { buffer = true, desc = "Insert print statement" })
vim.keymap.set("n", "<leader>pdb", "import pdb; pdb.set_trace()<Esc>", { buffer = true, desc = "Insert debugger" })
vim.keymap.set("n", "<leader>pt", "# TODO: <Left>", { buffer = true, desc = "Insert TODO comment" })

-- Python docstring template
vim.keymap.set(
	"n",
	"<leader>pd",
	'i"""<CR><CR>Args:<CR><CR>Returns:<CR><CR>"""<Esc>5kA',
	{ buffer = true, desc = "Insert docstring template" }
)
