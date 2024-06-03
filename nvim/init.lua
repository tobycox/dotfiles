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

vim.g.mapleader = ' '

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Convert window to terminal
vim.keymap.set('n', '<C-w>t', ':terminal zsh<CR>')

-- Save and quit
vim.keymap.set('n', '<C-S>', ':w<CR>')
vim.keymap.set('n', '<C-Q>', ':q<CR>')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Terminal navigation
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>')

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', 'C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', 'C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', 'C-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set('t', 'C-w>s', '<C-\\><C-n><C-w>s')
vim.keymap.set('t', 'C-w>v', '<C-\\><C-n><C-w>v')

require("lazy").setup("plugins", opts)

require("telescope").load_extension "file_browser"
require("spider").setup()
require('lualine').setup()
require('toggleterm').setup{
  open_mapping = [[<leader>t]],
}
require("focus").setup()
