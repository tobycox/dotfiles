return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
			vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#8c8fa1" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#9ca0b0", bold = true })
			vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#8c8fa1" })
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
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.notify").setup()
			require("mini.files").setup()
			vim.keymap.set("n", "<leader>l", ':lua MiniFiles.open(vim.fn.expand("%:p:h"))<CR>')

			require("mini.bracketed").setup()

			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
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
	-- {
	-- 	"nvim-focus/focus.nvim",
	-- 	version = "*",
	-- 	config = function()
	-- 		local ignore_filetypes = { "neo-tree" }
	-- 		local ignore_buftypes = { "nofile", "prompt", "popup", "terminal", "help", "quickfix" }
	--
	-- 		local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })
	--
	-- 		vim.api.nvim_create_autocmd("WinEnter", {
	-- 			group = augroup,
	-- 			callback = function(_)
	-- 				if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
	-- 					vim.w.focus_disable = true
	-- 				else
	-- 					vim.w.focus_disable = false
	-- 				end
	-- 			end,
	-- 			desc = "Disable focus autoresize for BufType",
	-- 		})
	--
	-- 		vim.api.nvim_create_autocmd("FileType", {
	-- 			group = augroup,
	-- 			callback = function(_)
	-- 				if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
	-- 					vim.b.focus_disable = true
	-- 				else
	-- 					vim.b.focus_disable = false
	-- 				end
	-- 			end,
	-- 			desc = "Disable focus autoresize for FileType",
	-- 		})
	-- 	end,
	-- },
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
	{ "danishprakash/vim-githubinator" },
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",

		config = function()
			require("gitsigns").setup({})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gs", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
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
				vim.keymap.set("n", "cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set({ "n", "x" }, "cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			require("lspconfig").eslint.setup({})
			require("lspconfig").rubocop.setup({})
			require("lspconfig").gopls.setup({})
			require("lspconfig").tailwindcss.setup({})
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
					go = { { "gofmt", "-s" }, { "goimports", "-w" } },
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
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<C-k>",
				},
			})
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
		opts = {
			tsserver_file_preferences = {
				includeInlayParameterNameHints = "all",
				includeCompletionsForModuleExports = true,
				quotePreference = "auto",
			},
			expose_as_code_action = "all",
		},
	},
	-- {
	-- 	"olimorris/codecompanion.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
	-- 		"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
	-- 		{ "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
	-- 	},
	-- 	config = function()
	-- 		require("codecompanion").setup()
	--
	-- 		vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap(
	-- 			"n",
	-- 			"<LocalLeader>ai",
	-- 			"<cmd>CodeCompanionChat Toggle<cr>",
	-- 			{ noremap = true, silent = true }
	-- 		)
	-- 		vim.api.nvim_set_keymap(
	-- 			"v",
	-- 			"<LocalLeader>ai",
	-- 			"<cmd>CodeCompanionChat Toggle<cr>",
	-- 			{ noremap = true, silent = true }
	-- 		)
	-- 		vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
	--
	-- 		-- Expand 'cc' into 'CodeCompanion' in the command line
	-- 		vim.cmd([[cab cc CodeCompanion]])
	-- 	end,
	-- },
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		behaviour = {
			support_paste_from_clipboard = true,
			minimize_diff = false,
		},
		file_selector = {
			provider = "telescope",
			-- Options override for custom providers
			provider_opts = {},
		},
		keys = {
			{
				"<leader>ip",
				function()
					return vim.bo.filetype == "AvanteInput" and require("avante.clipboard").paste_image()
						or require("img-clip").paste_image()
				end,
				desc = "clip: paste image",
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = true,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			-- basic telescope configuration
			local conf = require("telescope.config").values

			local function toggle_telescope(harpoon_files)
				local finder = function()
					local paths = {}
					for _, item in ipairs(harpoon_files.items) do
						table.insert(paths, item.value)
					end

					return require("telescope.finders").new_table({
						results = paths,
					})
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = finder(),
						previewer = false,
						sorter = require("telescope.config").values.generic_sorter({}),
						layout_config = {
							height = 0.4,
							width = 0.5,
							prompt_position = "top",
							preview_cutoff = 120,
						},
						attach_mappings = function(prompt_bufnr, map)
							map("i", "<C-d>", function()
								local state = require("telescope.actions.state")
								local selected_entry = state.get_selected_entry()
								local current_picker = state.get_current_picker(prompt_bufnr)

								table.remove(harpoon_files.items, selected_entry.index)
								current_picker:refresh(finder())
							end)
							return true
						end,
					})
					:find()
			end

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)

			vim.keymap.set("n", "<C-e>", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end)

			vim.keymap.set("n", "<leader>th", function()
				harpoon.ui:toggle_quick_menu(harpoon:list("term"))
			end, { desc = "Open harpoon's list of terminals " })
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}
