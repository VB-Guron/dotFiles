local set = vim.opt_local

-- C# specific settings
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- Unity/C# specific keymaps
vim.keymap.set("n", "<leader>cs", "Debug.Log();<Left><Left>", { buffer = true, desc = "Insert Debug.Log" })
vim.keymap.set("n", "<leader>cc", "// TODO: <Left>", { buffer = true, desc = "Insert TODO comment" })
vim.keymap.set(
	"n",
	"<leader>cp",
	"public  {  }<Left><Left><Left><Left><Left>",
	{ buffer = true, desc = "Insert property template" }
)

-- Unity MonoBehaviour methods
vim.keymap.set("n", "<leader>cu", "void Update() {\n    \n}<Esc>kA", { buffer = true, desc = "Insert Update method" })
vim.keymap.set("n", "<leader>ca", "void Awake() {\n    \n}<Esc>kA", { buffer = true, desc = "Insert Awake method" })
