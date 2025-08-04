local set = vim.opt_local

-- Lua specific settings (for your Arch configs)
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

-- Lua/Neovim specific keymaps
vim.keymap.set("n", "<leader>lp", "print()<Left>", { buffer = true, desc = "Insert print statement" })
vim.keymap.set("n", "<leader>lv", "vim.<Left>", { buffer = true, desc = "Insert vim prefix" })
vim.keymap.set("n", "<leader>lr", ":luafile %<CR>", { buffer = true, desc = "Reload current Lua file" })

-- Neovim config specific
if vim.fn.expand("%:p"):match("nvim") then
	vim.keymap.set(
		"n",
		"<leader>lk",
		"vim.keymap.set('n', '<leader>', '', { desc = '' })<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>",
		{ buffer = true, desc = "Insert keymap template" }
	)
end
