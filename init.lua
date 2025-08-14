-- DENO & JAVASCRIPT:
--   <leader>dt      - Toggle between Deno and TypeScript LSP
--   :DenoToggle     - Command to switch LSP servers ================================================================================================
-- Complete Neovim Configuration - Single File
-- A comprehensive setup combining essential plugins with custom functionality
-- ================================================================================================

-- ============================================================================
-- PLUGIN MANAGER SETUP (Lazy.nvim)
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- BASIC VIM SETTINGS
-- ============================================================================

-- Leader keys (must be set before plugin setup)
vim.g.mapleader = " " -- Space as leader key
vim.g.maplocalleader = " " -- Space as local leader

-- Line numbers and visual settings
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.wrap = false -- Don't wrap long lines
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.colorcolumn = "100" -- Show column at 100 chars

-- Indentation settings
vim.opt.tabstop = 2 -- Tab width (2 spaces)
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase used
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Show matches as you type

-- Visual and UI settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.showmode = false -- Don't show mode (status line will)
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options

-- File handling
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Key timeout duration
vim.opt.autoread = true -- Auto reload changed files

-- Behavior settings
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.errorbells = false -- No error bells
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.encoding = "UTF-8" -- Set encoding
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- ============================================================================
-- KEY MAPPINGS (Basic)
-- ============================================================================

-- Clear search highlights
vim.keymap.set("n", "<leader>cl", ":nohlsearch<CR>", { desc = "Clear search highlights" }) -- Changed from <leader>c

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window splitting and resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick save/quit (avoid conflicts)
vim.keymap.set("n", "<leader>fs", ":w<CR>", { desc = "Save file" }) -- Changed from <leader>w
vim.keymap.set("n", "<leader>qq", ":q<CR>", { desc = "Quit" }) -- Changed from <leader>q
vim.keymap.set("n", "<leader>qa", ":wq<CR>", { desc = "Save and quit" }) -- Changed from <leader>wq

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Better J behavior (join lines)
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines, keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================
local terminal_state = {
	buf = nil,
	win = nil,
	is_open = false,
}

local function FloatingTerminal()
	-- Toggle behavior: close if already open
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
		return
	end

	-- Create buffer if needed
	if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
		terminal_state.buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_option(terminal_state.buf, "bufhidden", "hide")
	end

	-- Calculate centered window dimensions
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Create floating window
	terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- Set transparent background
	vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none" })
	vim.api.nvim_win_set_option(
		terminal_state.win,
		"winhighlight",
		"Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder"
	)

	-- Start terminal if not running
	local has_terminal = false
	local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
	for _, line in ipairs(lines) do
		if line ~= "" then
			has_terminal = true
			break
		end
	end

	if not has_terminal then
		vim.fn.termopen(os.getenv("SHELL"))
	end

	terminal_state.is_open = true
	vim.cmd("startinsert")
end

-- Terminal keymaps
vim.keymap.set("n", "<leader>t", FloatingTerminal, { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<Esc>", function()
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
	end
end, { desc = "Close floating terminal" })

-- ============================================================================
-- AUTOCOMMANDS
-- ============================================================================
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Return to last edit position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-resize splits when window resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup,
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

-- ============================================================================
-- PLUGIN CONFIGURATION
-- ============================================================================
require("lazy").setup({

	-- ========================================
	-- CATPPUCCIN THEME
	-- ========================================
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- Load first
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true, -- Disable to remove transparency
				show_end_of_buffer = false,
				term_colors = false,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					treesitter = true,
					mason = true,
					which_key = true,
				},
			})

			-- Apply theme and transparency
			vim.cmd.colorscheme("catppuccin")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
		end,
	},

	-- ========================================
	-- TELESCOPE (Fuzzy Finder)
	-- ========================================
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-h>"] = "which_key",
						},
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
				extensions = {},
			})

			-- Telescope keymaps
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
		end,
	},

	-- ========================================
	-- FILE EXPLORER (Neo-tree)
	-- ========================================
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				default_component_configs = {
					container = {
						enable_character_fade = true,
					},
					indent = {
						indent_size = 2,
						padding = 1,
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
						with_expanders = nil,
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "ﰊ",
						default = "*",
						highlight = "NeoTreeFileIcon",
					},
					name = {
						trailing_slash = false,
						use_git_status_colors = true,
						highlight = "NeoTreeFileName",
					},
					git_status = {
						symbols = {
							added = "", -- or "✚", but this is redundant info
							modified = "", -- or "", but this is redundant info
							deleted = "✖", -- this can only be used in the git_status source
							renamed = "", -- this can only be used in the git_status source
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
				window = {
					position = "left",
					width = 40,
					mapping_options = {
						noremap = true,
						nowait = true,
					},
				},
				filesystem = {
					window = {
						mappings = {
							["<bs>"] = "navigate_up",
							["."] = "set_root",
							["H"] = "toggle_hidden",
							["/"] = "fuzzy_finder",
							["D"] = "fuzzy_finder_directory",
							["f"] = "filter_on_submit",
							["<c-x>"] = "clear_filter",
							["[g"] = "prev_git_modified",
							["]g"] = "next_git_modified",
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
			vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus file explorer" })
		end,
	},

	-- ========================================
	-- TREESITTER (Syntax Highlighting)
	-- ========================================
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"python",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					"scss",
					"json",
					"yaml",
					"markdown",
					"bash",
					"go",
					"rust",
					"java",
					"php",
					"vue",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				fold = {
					enable = true,
				},
			})

			-- Set folding based on treesitter
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldlevel = 99 -- Start with all folds open
		end,
	},

	-- ========================================
	-- LSP CONFIGURATION
	-- ========================================
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			-- Setup neodev for better Lua experience
			require("neodev").setup()

			-- Setup mason
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- Setup mason-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"ts_ls", -- TypeScript/JavaScript
					"html", -- HTML
					"cssls", -- CSS
					"tailwindcss", -- Tailwind CSS
					"jsonls", -- JSON
					"pyright", -- Python
					"bashls", -- Bash
				},
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- LSP keybindings
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, silent = true }

				-- LSP keybindings (avoid conflicts with gitsigns)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts) -- Changed from gr
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts) -- Changed from <leader>d
				vim.keymap.set("n", "<leader>ql", vim.diagnostic.setloclist, opts) -- Changed from <leader>q
			end

			-- Configure language servers
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							telemetry = { enable = false },
							workspace = { checkThirdParty = false },
							diagnostics = { globals = { "vim" } },
						},
					},
				},
				ts_ls = {
					filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
					-- Disable ts_ls in Deno projects
					root_dir = function(fname)
						local deno_root = lspconfig.util.root_pattern("deno.json", "deno.jsonc")(fname)
						if deno_root then
							return nil -- Don't start ts_ls in Deno projects
						end
						return lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")(
							fname
						)
					end,
				},
				html = {},
				cssls = {},
				tailwindcss = {
					filetypes = {
						"html",
						"css",
						"scss",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
					},
				},
				jsonls = {},
				pyright = {},
				bashls = {},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = { prefix = "●" },
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
				},
			})

			-- Diagnostic signs
			local signs = { Error = "✗", Warn = "⚠", Hint = "💡", Info = "ℹ" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},

	-- ========================================
	-- AUTOCOMPLETION
	-- ========================================
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load friendly snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	-- Format on exit from insert mode
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "InsertLeave" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					vue = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					python = { "black" },
					sh = { "shfmt" },
					-- Deno formatting
					["typescript.deno"] = { "deno_fmt" },
					["javascript.deno"] = { "deno_fmt" },
				},

				-- Format on save with increased timeout
				format_on_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 2000, lsp_fallback = true } -- Increased from 500ms to 2000ms
				end,

				-- Prettier with Tailwind support and increased timeout
				formatters = {
					prettier = {
						command = "prettier",
						args = {
							"--stdin-filepath",
							"$FILENAME",
							"--single-quote",
							"--jsx-single-quote",
							"--plugin",
							"prettier-plugin-tailwindcss",
						},
						stdin = true,
						timeout_ms = 2000, -- Added explicit timeout for prettier
					},
					deno_fmt = {
						command = "deno",
						args = { "fmt", "-" },
						stdin = true,
						timeout_ms = 2000, -- Added timeout for deno_fmt
					},
					stylua = {
						timeout_ms = 2000, -- Added timeout for stylua
					},
					black = {
						timeout_ms = 2000, -- Added timeout for black
					},
				},
			})

			-- Format on insert leave with increased timeout
			vim.api.nvim_create_autocmd("InsertLeave", {
				group = vim.api.nvim_create_augroup("ConformFormatOnInsertLeave", { clear = true }),
				callback = function()
					if not vim.g.disable_autoformat and not vim.b.disable_autoformat then
						require("conform").format({
							async = true,
							lsp_fallback = true,
							timeout_ms = 2000, -- Increased timeout for insert leave formatting
						})
					end
				end,
			})

			-- Manual format keymaps with increased timeout
			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				require("conform").format({
					async = true,
					lsp_fallback = true,
					timeout_ms = 2000, -- Increased timeout for manual formatting
				})
			end, { desc = "Format buffer" })

			-- Toggle format on save
			vim.keymap.set("n", "<leader>tf", function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				print("Format on save " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
			end, { desc = "Toggle format on save" })

			-- Toggle format on insert leave
			vim.keymap.set("n", "<leader>ti", function()
				vim.g.disable_insert_format = not vim.g.disable_insert_format
				print("Format on insert leave " .. (vim.g.disable_insert_format and "disabled" or "enabled"))
			end, { desc = "Toggle format on insert leave" })
		end,
	},
	-- ========================================
	-- STATUS LINE
	-- ========================================
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},

	-- ========================================
	-- GIT INTEGRATION
	-- ========================================
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "<leader>gj", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, desc = "Next git hunk" })

					map("n", "<leader>gk", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, desc = "Previous git hunk" })

					-- Actions (avoid conflict with LSP gr)
					map("n", "<leader>gh", gs.stage_hunk, { desc = "Stage hunk" }) -- Changed from gs
					map("n", "<leader>gu", gs.reset_hunk, { desc = "Reset hunk" }) -- Changed from gr
					map("v", "<leader>gh", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Stage hunk" })
					map("v", "<leader>gu", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Reset hunk" })
					map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
					map("n", "<leader>gU", gs.undo_stage_hunk, { desc = "Undo stage hunk" }) -- Changed from gu
					map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
					map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
					map("n", "<leader>gb", function()
						gs.blame_line({ full = true })
					end, { desc = "Blame line" })
					map("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
				end,
			})
		end,
	},

	-- ========================================
	-- UTILITY PLUGINS
	-- ========================================

	-- Auto pairs for brackets, quotes, etc.
	{
		"windwp/nvim-autopairs",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				check_ts = true, -- Enable treesitter
				ts_config = {
					lua = { "string" }, -- Don't add pairs in lua string treesitter nodes
					javascript = { "template_string" },
				},
			})

			-- Integration with nvim-cmp
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- Smart commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = true,
				ignore = nil,
				toggler = {
					line = "gcc", -- Line-comment toggle keymap
					block = "gbc", -- Block-comment toggle keymap
				},
				opleader = {
					line = "gc", -- Line-comment keymap
					block = "gb", -- Block-comment keymap
				},
				extra = {
					above = "gcO", -- Add comment on the line above
					below = "gco", -- Add comment on the line below
					eol = "gcA", -- Add comment at the end of line
				},
				mappings = {
					basic = true,
					extra = true,
				},
			})
		end,
	},

	-- Surround text objects
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					insert = "<C-g>s",
					insert_line = "<C-g>S",
					normal = "ys",
					normal_cur = "yss",
					normal_line = "yS",
					normal_cur_line = "ySS",
					visual = "S",
					visual_line = "gS",
					delete = "ds",
					change = "cs",
				},
			})
		end,
	},

	-- Which-key for keybinding help
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				plugins = {
					marks = true,
					registers = true,
					spelling = {
						enabled = true,
						suggestions = 20,
					},
				},
				win = {
					border = "rounded",
					position = "bottom",
					margin = { 1, 0, 1, 0 },
					padding = { 2, 2, 2, 2 },
					winblend = 0,
				},
				layout = {
					height = { min = 4, max = 25 },
					width = { min = 20, max = 50 },
					spacing = 3,
					align = "left",
				},
				spec = {
					{ "<leader>f", group = "file/find" },
					{ "<leader>g", group = "git" },
					{ "<leader>b", group = "buffer" },
					{ "<leader>s", group = "split" },
					{ "<leader>t", group = "terminal/toggle" },
					{ "<leader>c", group = "code" },
					{ "<leader>d", group = "diagnostics" },
					{ "<leader>r", group = "rename" },
					{ "<leader>n", group = "next" },
					{ "<leader>p", group = "previous" },
				},
			})
		end,
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = { enabled = false },
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						"Trouble",
						"lazy",
						"mason",
					},
				},
			})
		end,
	},

	-- Buffer line (tabs)
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					themable = true,
					numbers = "none",
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					middle_mouse_command = nil,
					indicator = {
						icon = "▎",
						style = "icon",
					},
					buffer_close_icon = "",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					max_name_length = 30,
					max_prefix_length = 30,
					truncate_names = true,
					tab_size = 21,
					diagnostics = "nvim_lsp",
					diagnostics_update_in_insert = false,
					color_icons = true,
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					show_tab_indicators = true,
					persist_buffer_sort = true,
					separator_style = "thin",
					enforce_regular_tabs = true,
					always_show_bufferline = true,
				},
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
			})

			-- Buffer navigation keymaps
			vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
			vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
			vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
			vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
			vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
			vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
			vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
			vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
		end,
	},
})

-- ============================================================================
-- DENO UTILITIES
-- ============================================================================

-- Function to detect if current project is a Deno project
local function is_deno_project()
	local deno_files = { "deno.json", "deno.jsonc", "deno.lock" }
	for _, file in ipairs(deno_files) do
		if vim.fn.filereadable(file) == 1 then
			return true
		end
	end
	return false
end

-- Command to toggle between Deno and Node.js LSP
vim.api.nvim_create_user_command("DenoToggle", function()
	local current_buf = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = current_buf })

	-- Check if Deno LSP is running
	local has_deno = false
	local has_tsserver = false

	for _, client in ipairs(clients) do
		if client.name == "denols" then
			has_deno = true
		elseif client.name == "ts_ls" then
			has_tsserver = true
		end
	end

	if has_deno then
		vim.cmd("LspStop denols")
		vim.cmd("LspStart ts_ls")
		print("Switched to TypeScript LSP")
	elseif has_tsserver then
		vim.cmd("LspStop ts_ls")
		vim.cmd("LspStart denols")
		print("Switched to Deno LSP")
	else
		if is_deno_project() then
			vim.cmd("LspStart denols")
			print("Started Deno LSP")
		else
			vim.cmd("LspStart ts_ls")
			print("Started TypeScript LSP")
		end
	end
end, { desc = "Toggle between Deno and TypeScript LSP" })

-- Keymap for Deno toggle
vim.keymap.set("n", "<leader>dt", ":DenoToggle<CR>", { desc = "Toggle Deno/TypeScript LSP" })

-- Auto-detect and set filetype for Deno projects
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" },
	callback = function()
		if is_deno_project() then
			local ft = vim.bo.filetype
			if ft == "typescript" then
				vim.bo.filetype = "typescript.deno"
			elseif ft == "javascript" then
				vim.bo.filetype = "javascript.deno"
			end
		end
	end,
})

-- ============================================================================
-- ADDITIONAL FUNCTIONS AND COMMANDS
-- ============================================================================

-- Copy full file path function
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("Copied path: " .. path)
end, { desc = "Copy full file path" })

-- Smart buffer close function
local function smart_close_buffer()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	if #buffers > 1 then
		vim.cmd("bdelete")
	else
		vim.cmd("quit")
	end
end
vim.keymap.set("n", "<leader>bx", smart_close_buffer, { desc = "Smart close buffer" })

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- Set filetype-specific indentation
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "lua", "python" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "javascript", "typescript", "json", "html", "css", "scss", "jsx", "tsx" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- ============================================================================
-- USEFUL COMMANDS
-- ============================================================================

-- Format commands
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.g.disable_autoformat = true
	else
		vim.b.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- LSP info command
vim.api.nvim_create_user_command("LspInfo", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		print("No LSP clients attached to current buffer")
	else
		for _, client in ipairs(clients) do
			print("LSP: " .. client.name .. " (ID: " .. client.id .. ")")
		end
	end
end, { desc = "Show LSP client info" })

-- ============================================================================
-- FINAL CONFIGURATION
-- ============================================================================

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
vim.opt.synmaxcol = 300

-- Better command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar", "node_modules" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Set cursor shape
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50"

print("🚀 Neovim configuration loaded successfully!")

-- ============================================================================
-- QUICK REFERENCE
-- ============================================================================
--
-- LEADER KEY: <Space>
--
-- FILE OPERATIONS:
--   <leader>fs      - Save file
--   <leader>qq      - Quit
--   <leader>qa      - Save and quit
--   <leader>e       - Toggle file explorer
--   <leader>ff      - Find files (Telescope)
--   <leader>fg      - Live grep (search in files)
--   <leader>fr      - Recent files
--
-- BUFFER/WINDOW:
--   <leader>bn/bp   - Next/Previous buffer
--   <leader>bd      - Delete buffer
--   <leader>sv/sh   - Split vertical/horizontal
--   <Ctrl-h/j/k/l>  - Navigate windows
--   <Shift-h/l>     - Cycle buffers
--
-- CODE:
--   <leader>f       - Format code
--   <leader>ca      - Code actions
--   <leader>rn      - Rename symbol
--   <leader>lr      - Find references
--   gd              - Go to definition
--   gi              - Go to implementation
--   K               - Hover documentation
--
-- GIT:
--   <leader>gh      - Stage hunk
--   <leader>gu      - Reset hunk
--   <leader>gp      - Preview hunk
--   <leader>gb      - Blame line
--
-- DIAGNOSTICS:
--   <leader>dd      - Open diagnostic float
--   <leader>nd      - Next diagnostic
--   <leader>pd      - Previous diagnostic
--   <leader>ql      - Diagnostics to location list
--
-- TERMINAL:
--   <leader>t       - Toggle floating terminal
--   <Esc>           - Close terminal (in terminal mode)
--
-- UTILITIES:
--   gcc/gbc         - Comment line/block
--   ys/ds/cs        - Surround add/delete/change
--   <leader>cl      - Clear search highlights
--   <leader>pa      - Copy file path
--
-- ============================================================================
