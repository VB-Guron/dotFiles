local set = vim.opt_local

-- JavaScript/TypeScript specific settings
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

-- Enable concealing for better JSX/TSX experience
set.conceallevel = 0

-- Faster updates for better development experience
set.updatetime = 300

-- JSX/TSX specific keymaps
vim.keymap.set("n", "<leader>js", "console.log();<Left><Left>", { buffer = true, desc = "Insert console.log" })
vim.keymap.set("n", "<leader>jc", "// TODO: <Left>", { buffer = true, desc = "Insert TODO comment" })

-- React specific snippets (if using React)
if vim.fn.search("import.*React", "nw") > 0 then
	vim.keymap.set(
		"i",
		"rfc",
		"function ComponentName() {\n  return (\n    <div>\n      \n    </div>\n  );\n}\n\nexport default ComponentName;",
		{ buffer = true }
	)
end
