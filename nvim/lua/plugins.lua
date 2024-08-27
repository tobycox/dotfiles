return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>p", "<cmd>Telescope find_files path=%:p:h select_buffer=true<cr>", desc = "Telescope Find" },
			{ "<leader>r", "<cmd>Telescope oldfiles path=%:p:h select_buffer=true<cr>", desc = "Telescope Old Files" },
			{ "<leader>f", "<cmd>Telescope live_grep path=%:p:h select_buffer=true<cr>", desc = "Telescope Grep" },
			{
				"<leader>g",
				"<cmd>Telescope grep_string path=%:p:h select_buffer=true<cr>",
				desc = "Telescope Grep String",
			},
			{
				"<leader>x",
				"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
				desc = "Telescope File Browser",
			},
		},
	},
	{ "echasnovski/mini.nvim", version = "*" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"chrisgrieser/nvim-spider",
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
		},
	},
	{ "nvim-focus/focus.nvim", version = "*" },
	-- { 'github/copilot.vim' },
	{
		"numToStr/Comment.nvim",
		opts = {
			lazy = false,
		},
	},
	{ "nvim-treesitter/nvim-treesitter", opts = {
		ignore_install = { "help" },
	} },
	{
		"folke/trouble.nvim",
		opts = {
			modes = {
				preview_float = {
					mode = "diagnostics",
					preview = {
						type = "float",
						relative = "editor",
						border = "rounded",
						title = "Preview",
						title_pos = "center",
						position = { 0, -2 },
						size = { width = 0.3, height = 0.3 },
						zindex = 200,
					},
				},
			},
		}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"nanozuki/tabby.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup()

			vim.keymap.set("n", "<leader>gb", ":BlameToggle<CR>")
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{
		"neovim/nvim-lspconfig",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		config = function()
			local lsp_zero = require("lsp-zero")

			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			require("lspconfig").eslint.setup({})
			require("lspconfig").rubocop.setup({})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup()
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
	{
		"s1n7ax/nvim-terminal",
		config = function()
			vim.o.hidden = true
			require("nvim-terminal").setup({
				window = {
					height = 30,
				},
			})
		end,
	},
	{
		"sitiom/nvim-numbertoggle",
		cond = vim.g.smart_relativenumber,
		lazy = false,
	},
	{
		"onsails/lspkind-nvim",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-emoji",
			"SirVer/ultisnips",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						-- For `ultisnips` user.
						vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
					["<Esc>"] = cmp.mapping.close(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				}),
				sources = {
					{ name = "nvim_lsp" }, -- For nvim-lsp
					{ name = "ultisnips" }, -- For ultisnips user.
					{ name = "nvim_lua" }, -- for nvim lua function
					{ name = "path" }, -- for path completion
					{ name = "buffer", keyword_length = 4 }, -- for buffer word completion
					{ name = "omni" },
					{ name = "emoji", insert = true }, -- emoji completion
					{ name = "supermaven" },
				},
				completion = {
					keyword_length = 1,
					completeopt = "menu,noselect",
				},
				view = {
					entries = "custom",
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						menu = {
							nvim_lsp = "[LSP]",
							ultisnips = "[US]",
							nvim_lua = "[Lua]",
							path = "[Path]",
							buffer = "[Buffer]",
							emoji = "[Emoji]",
							omni = "[Omni]",
						},
					}),
				},
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "VonHeikemen/lsp-zero.nvim", "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		build = "make",
		opts = {
			-- add any opts here
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below is optional, make sure to setup it properly if you have lazy=true
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
		config = function()
			require("avante").setup()
			vim.opt.laststatus = 2
		end,
	},
	{
		"joshuavial/aider.nvim",
		config = function()
			require("aider").setup()
			vim.keymap.set("n", "<leader>ai", ':lua AiderOpen("-3", "hsplit")<cr>', { noremap = true, silent = true })
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
