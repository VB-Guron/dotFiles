local opts = { noremap = true, silent = true }

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- === KEEP ALL YOUR EXISTING KEYMAPS ===
-- (They're excellent! Just adding a few optimizations)

-- Visual line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up in visual selection" })

-- Navigation improvements
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Visual indent
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Clipboard management
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dp', opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Quick escape and clear
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlight", silent = true })

-- Formatting (will be handled by conform.nvim)
vim.keymap.set("n", "<leader>f", function()
	local conform_ok, conform = pcall(require, "conform")
	if conform_ok then
		conform.format({ async = true, lsp_fallback = true })
	else
		vim.lsp.buf.format()
	end
end, { desc = "Format code" })

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Tmux integration
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Better delete
vim.keymap.set("n", "x", '"_x', opts)

-- Global replace
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Better window navigation (for tmux integration)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- File path copy
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- LSP diagnostics toggle
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
	vim.diagnostic.config({
		virtual_text = isLspDiagnosticsVisible,
		underline = isLspDiagnosticsVisible,
	})
end, { desc = "Toggle LSP diagnostics" })

-- === NEW ADDITIONS FOR YOUR WORKFLOW ===

-- Quick save (essential for development)
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and quit" })

-- Buffer management
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })

-- Quick quit
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Force quit all" })

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Auto-create directory when saving file
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("auto-create-dir", { clear = true }),
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
