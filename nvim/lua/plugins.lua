return {
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
          { "<leader>p", "<cmd>Telescope find_files path=%:p:h select_buffer=true<cr>", desc = "Telescope Find" },
          { "<leader>r", "<cmd>Telescope oldfiles path=%:p:h select_buffer=true<cr>", desc = "Telescope Old Files" },
          { "<leader>f", "<cmd>Telescope live_grep path=%:p:h select_buffer=true<cr>", desc = "Telescope Grep" },
          { "<leader>x", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Telescope File Browser" },
        },
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- or 'light'

      vim.cmd.colorscheme 'solarized'
    end,
  },
  { 'echasnovski/mini.nvim', version = '*' },
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'tpope/vim-fugitive',
    keys = {
      { "<leader>gs", "<cmd>:Git<cr>" },
      { "<leader>gc", "<cmd>:Gcommit<cr>" },
      { "<leader>ga", "<cmd>:Gwrite<cr>" },
      { "<leader>gl", "<cmd>:Glog<cr>" },
      { "<leader>gd", "<cmd>:Gdiff<cr>" },
      { "<leader>gh", "<cmd>:GBrowse<cr>" },
      { "<leader>gb", "<cmd>:Git blame<cr>" },
    }
  },
  {
    'chrisgrieser/nvim-spider',
    keys = {
      {
        "<leader>e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "<leader>w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "<leader>b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
    }
  },
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  { 'nvim-focus/focus.nvim', version = '*' },
  { 'github/copilot.vim' },
  {
    'Shougo/ddc.vim',
    dependencies = { 'vim-denops/denops.vim' }
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = '<leader>c<space>',
      },
      lazy = false,
    }
  },
  {
    "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
      -- main one
      { "ms-jpq/coq_nvim", branch = "coq" },

      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts", branch = "artifacts" },

      -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
      -- Need to **configure separately**
      { 'ms-jpq/coq.thirdparty', branch = "3p" }
      -- - shell repl
      -- - nvim lua api
      -- - scientific calculator
      -- - comment banner
      -- - etc
    },
    init = function()
      vim.g.coq_settings = {
          auto_start = true, -- if you want to start COQ at startup
          -- Your COQ settings here
      }
    end,
    config = function()
      -- Your LSP settings here
    end,
  }
}
