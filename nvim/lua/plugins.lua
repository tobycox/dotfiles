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
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
						}, -- n
						i = {
							["<C-h>"] = "which_key",
							["<c-d>"] = require("telescope.actions").delete_buffer,
						}, -- i
					}, -- mappings
				}, -- defaults
			}) -- telescope setup
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>p", "<cmd>Telescope find_files path=%:p:h select_buffer=true<cr>", desc = "Telescope Find" },
			{ "<leader>r", "<cmd>Telescope oldfiles path=%:p:h select_buffer=true<cr>", desc = "Telescope Old Files" },
			{ "<leader>f", "<cmd>Telescope live_grep path=%:p:h select_buffer=true<cr>", desc = "Telescope Grep" },
			{ "<leader>o", "<cmd>Telescope buffers path=%:p:h select_buffer=true<cr>", desc = "Telescope Buffers" },
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
			require("mini.surround").setup()
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
		"alvarosevilla95/luatab.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("luatab").setup()
		end,
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
	-- {
	-- 	"nanozuki/tabby.nvim",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- },
	{ "danishprakash/vim-githubinator" },
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",

		config = function()
			require("gitsigns").setup({})
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", "<cmd>tab Git<cr>", { desc = "Git Status" })
			vim.keymap.set("n", "<leader>gc", "<cmd>tab Git commit<cr>", { desc = "Git Commit" })
			vim.keymap.set("n", "<leader>ga", "<cmd>tab Git add<cr>", { desc = "Git Add" })
			vim.keymap.set("n", "<leader>gl", "<cmd>tab Git log<cr>", { desc = "Git Log" })
			vim.keymap.set("n", "<leader>gd", "<cmd>tab Git diff<cr>", { desc = "Git Diff" })
			vim.keymap.set("n", "<leader>gb", "<cmd>tab Git blame<cr>", { desc = "Git Blame" })
		end,
	},
	{
		"tpope/vim-rhubarb",
		dependencies = {
			"tpope/vim-fugitive",
		},
		config = function()
			vim.keymap.set("n", "<leader>gh", "<cmd>GBrowse<cr>", { desc = "Git Browse" })
		end,
	},
	{
		"tpope/vim-abolish",
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
				vim.keymap.set("n", "<M-R>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			vim.o.updatetime = 250 -- ¼‑second cursor hold delay

			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
				end,
			})

			vim.diagnostic.config({
				float = {
					border = "rounded", -- 'single', 'double', 'shadow', etc.
					source = "if_many", -- show the LSP name if there’s more than one
					header = "", -- don’t waste a line on “Diagnostics”
					focusable = false,
					format = function(diag)
						-- │ Error: something broke       eslint
						local symbol = ({
							[vim.diagnostic.severity.ERROR] = " ",
							[vim.diagnostic.severity.WARN] = " ",
							[vim.diagnostic.severity.INFO] = " ",
							[vim.diagnostic.severity.HINT] = "󰌵 ",
						})[diag.severity] or ""
						return symbol .. diag.message
					end,
				},
			})

			require("lspconfig").eslint.setup({})
			require("lspconfig").rubocop.setup({})
			require("lspconfig").gopls.setup({})
			require("lspconfig").tailwindcss.setup({})
			require("lspconfig").ruby_lsp.setup({})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- javascript = { "biome" },
					-- typescript = { "biome" },
					-- typescriptreact = { "biome" },
					javascript = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },
					ruby = { "rubocop" },
					eruby = function(bufnr)
						-- Check if the file is an ERB YAML file
						local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
						if filetype == "eruby.yaml" then
							return { "yamlfix" }
						else
							return { "erb_format" }
						end
					end,
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 500,
				},
				format_after_save = {
					lsp_format = "fallback",
				},
			})
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<C-k>",
				},
				ignore_filetypes = { codecompanion = true },
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
	-- 		-- "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
	-- 		-- "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
	-- 		-- { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
	-- 	},
	-- 	config = function()
	-- 		require("codecompanion").setup({
	-- 			strategies = {
	-- 				chat = {
	-- 					adapter = "gemini",
	-- 				},
	-- 				inline = {
	-- 					adapter = "gemini",
	-- 				},
	-- 			},
	-- 			display = {
	-- 				chat = {
	-- 					-- Change the default icons
	-- 					icons = {
	-- 						pinned_buffer = " ",
	-- 						watched_buffer = "👀 ",
	-- 					},
	--
	-- 					-- Alter the sizing of the debug window
	-- 					debug_window = {
	-- 						---@return number|fun(): number
	-- 						width = vim.o.columns - 5,
	-- 						---@return number|fun(): number
	-- 						height = vim.o.lines - 2,
	-- 					},
	--
	-- 					-- Options to customize the UI of the chat buffer
	-- 					window = {
	-- 						layout = "vertical", -- float|vertical|horizontal|buffer
	-- 						position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
	-- 						border = "solid",
	-- 						height = 0.8,
	-- 						width = 0.25,
	-- 						relative = "editor",
	-- 						opts = {
	-- 							breakindent = true,
	-- 							cursorcolumn = false,
	-- 							cursorline = false,
	-- 							foldcolumn = "0",
	-- 							linebreak = true,
	-- 							list = false,
	-- 							numberwidth = 1,
	-- 							signcolumn = "no",
	-- 							spell = false,
	-- 							wrap = true,
	-- 						},
	-- 					},
	--
	-- 					---Customize how tokens are displayed
	-- 					---@param tokens number
	-- 					---@param adapter CodeCompanion.Adapter
	-- 					---@return string
	-- 					token_count = function(tokens, adapter)
	-- 						return " (" .. tokens .. " tokens)"
	-- 					end,
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap(
	-- 			"n",
	-- 			"<Leader>aa",
	-- 			"<cmd>CodeCompanionChat Toggle<cr>",
	-- 			{ noremap = true, silent = true }
	-- 		)
	-- 		vim.api.nvim_set_keymap(
	-- 			"v",
	-- 			"<Leader>aa",
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
			provider = "gemini",
			gemini = {
				model = "gemini-2.5-pro-exp-03-25", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
			},
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "o3-mini",
				timeout = 600000,
				temperature = 0,
				max_tokens = 16384,
				-- reasoning_effort = "high"
			},
			claude = {
				disable_tools = true,
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		behaviour = {
			support_paste_from_clipboard = true,
			minimize_diff = false,
			enable_token_counting = false,
			disabled_tools = { "python" },
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
		},
		custom_tools = {
			{
				name = "run_rails_tests", -- Unique name for the tool
				description = "Run Rails tests and return results", -- Description shown to AI
				command = "go test -v ./...", -- Shell command to execute
				returns = "test results",
				func = function(params, on_log, on_complete) -- Custom function to execute
					local target = params.target or ""
					return vim.fn.system(string.format("bin/rails test %s", target))
				end,
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
		"mrjones2014/smart-splits.nvim",
		config = function()
			vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
			vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
			vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
			vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
			-- moving between splits
			vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
			vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
			vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
			vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
			vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
			-- -- swapping buffers between windows
			-- vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
			-- vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
			-- vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
			-- vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
		end,
	},
	{
		"tpope/vim-rails",
	},
	{ "RRethy/vim-illuminate" },
	{ "kevinhwang91/nvim-bqf" },
}
