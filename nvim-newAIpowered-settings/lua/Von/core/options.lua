-- Disable netrw for better file manager integration
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

-- Optimized for your web dev stack (2 spaces for JS/TS/HTML/CSS)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Folding (optimized for nvim-ufo)
vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldcolumn = "0"

vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- Clipboard and mouse
vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true
vim.opt.mouse = "a"

-- EditorConfig support
vim.g.editorconfig = true

-- Performance optimizations
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
