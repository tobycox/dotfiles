local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Save and quit
vim.keymap.set("n", "<C-S>", ":w<CR>")
vim.keymap.set("n", "<C-Q>", ":q<CR>")

-- Tab width
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Relative line numbers
vim.wo.number = true

-- Bounce back files
vim.keymap.set("n", "<leader><leader>", "<C-^>")

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Terminal navigation
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-w>s", "<C-\\><C-n><C-w>s")
vim.keymap.set("t", "<C-w>v", "<C-\\><C-n><C-w>v")

-- Show tab UI
vim.opt.showtabline = 1

-- Tab Navigation
vim.keymap.set("n", "<C-w>n", ":tabnext<CR>")
vim.keymap.set("n", "<C-w>p", ":tabprev<CR>")
vim.keymap.set("n", "<C-w>c", ":tabnew<CR>")
vim.keymap.set("t", "<C-w>n", "<C-\\><C-n>:tabnext<CR>")
vim.keymap.set("t", "<C-w>p", "<C-\\><C-n>:tabprev<CR>")
vim.keymap.set("t", "<C-w>c", "<C-\\><C-n>:tabnew<CR>")

-- Remap the ctrl caret to exit terminal mode
vim.keymap.set("t", "<^-K>", "<C-\\><C-n><C-w>K")

-- Some nice terminal config
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")

-- Neogit
vim.keymap.set("n", "<leader>gs", ":Neogit<CR>")

-- Current buffer
vim.keymap.set("n", "<leader>l", '@+=expand("%")<CR>')

-- Enable splitbelow
vim.opt.splitbelow = true

-- Smartcase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Blame

-- Plugin Config
require("lazy").setup("plugins", opts)

require("telescope").load_extension("file_browser")
require("spider").setup()
require("lualine").setup()
require("focus").setup()
require("nvim-treesitter.configs").setup({
	indent = {
		enable = true,
		disable = { "python", "c" }, -- these and some other langs don't work well
	},
})

require("tabby").setup({
	preset = "active_wins_at_tail",
	option = {
		theme = {
			fill = "TabLineFill", -- tabline background
			head = "TabLine", -- head element highlight
			current_tab = "TabLineSel", -- current tab label highlight
			tab = "TabLine", -- other tab label highlight
			win = "TabLine", -- window highlight
			tail = "TabLine", -- tail element highlight
		},
		nerdfont = true, -- whether use nerdfont
		lualine_theme = nil, -- lualine theme name
		buf_name = {
			mode = "'unique'|'relative'|'tail'|'shorten'",
		},
	},
})

require("mason").setup()

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()
	end,
})

vim.lsp.set_log_level("debug")
