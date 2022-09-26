local fn = vim.fn


-- Automatically install paccker
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
      " autocmd!
      " autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({
				border = "rounded",
			})
		end,
	},
	profile = {
		enable = true,
		threshold = 10, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
	},
	autoremove = true, -- Remove disabled or unused plugins without prompting the user
})

-- Install your plugins here
return packer.startup(function(use)
	-- https://github.com/rockerBOO/awesome-neovim#project
	-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/plugins.lua
	-- https://github.com/search?l=Lua&o=desc&q=neovim+plugin&s=stars&type=Repositories

	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself

	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("user.autopairs")
		end,
		after = "nvim-cmp",
		requires = "nvim-cmp",
	}) -- Autopairs, integrates with both cmp and treesitter

	use({
		"numToStr/Comment.nvim",
		after = { "nvim-ts-context-commentstring", after = "nvim-treesitter" },
		event = "BufWinEnter",
		config = function()
			require("user.comment")
		end,
	})

	use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })

	-- https://github.com/kyazdani42/nvim-tree.lua
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		cmd = "NvimTreeToggle",
		after = "nvim-web-devicons",
		config = function()
			require("user.nvim-tree")
		end,
		tag = "nightly", -- optional, updated every week.
	})

	-- https://github.com/akinsho/bufferline.nvim
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		event = "BufWinEnter",
		config = function()
			require("user.bufferline")
		end,
	})

	use({ "moll/vim-bbye" })

	-- https://github.com/nvim-lualine/lualine.nvim
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		--after = { "bufferline.nvim", "gitsigns.nvim", "onedark.nvim" },
		config = function()
			require("user.lualine")
		end,
	})

	--https://github.com/akinsho/toggleterm.nvim
	use({
		"akinsho/toggleterm.nvim",
		--event = "BufRead",
		config = function()
			require("user.toggleterm")
		end,
	})

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("user.project")
		end,
	})

	use({ "lewis6991/impatient.nvim" })

	-- https://github.com/lukas-reineke/indent-blankline.nvim
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		cmd = "IndentBlanklineRefresh",
		config = function()
			require("user.indentline")
		end,
	})

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("user.alpha")
		end,
	})

	-- cmp plugins
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ --https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
				"hrsh7th/cmp-nvim-lsp-signature-help",
				after = "nvim-cmp",
				disable = true,
			},
			{ --https://github.com/ray-x/lsp_signature.nvim
				"ray-x/lsp_signature.nvim",
				config = function()
					require("user.lsp-signature")
				end,
			},
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "lukas-reineke/cmp-under-comparator", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
		},
		event = "InsertEnter",
		config = function()
			require("user.cmp")
		end,
	}) -- The completion plugin

	-- snippets
	use({ "L3MON4D3/LuaSnip", after = "nvim-cmp" }) --snippet engine

	use({
		"rafamadriz/friendly-snippets",
		after = "LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	}) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP

	--[[ use { "williamboman/nvim-lsp-installer"} -- simple to use language server installer ]]
	use({ "williamboman/mason.nvim" })

	use({ "williamboman/mason-lspconfig.nvim" })

	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters

	use({
		"RRethy/vim-illuminate",
		event = "BufRead",
		config = function()
			require("user.illuminate")
		end,
	})

	-- Telescope
	-- https://github.com/nvim-telescope/telescope.nvim
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		after = "plenary.nvim",
		--cmd = "Telescope",
		module = "telescope",
		config = function()
			require("user.telescope")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			{ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" },
			{ --https://github.com/nvim-treesitter/nvim-treesitter-textobjects
				"nvim-treesitter/nvim-treesitter-textobjects",
				after = "nvim-treesitter",
			},
		},
		event = "BufWinEnter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		--event = "BufRead",
		config = function()
			require("user.treesitter")
		end,
	})
	use({
		"abecodes/tabout.nvim",
		config = function()
			require("user.tabout")
		end,
		wants = { "nvim-treesitter" }, -- or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	})
	-- Git
	-- https://github.com/lewis6991/gitsigns.nvim
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		after = { "plenary.nvim" },
		config = function()
			require("user.gitsigns")
		end,
	})

	-- DAP
	-- https://github.com/mfussenegger/nvim-dap
	use({
		"mfussenegger/nvim-dap",
		cmd = { "BreakpointToggle", "Debug", "DapREPL" },
		config = function()
			require("user.dap")
		end,
	})

	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, after = "nvim-dap" })

	use({ "ravenxrz/DAPInstall.nvim", after = "nvim-dap" }) -- Automatically set up your configuration after cloning packer.nvim

	-- Symbol Tree
	-- https://github.com/simrat39/symbols-outline.nvim
	-- https://github.com/stevearc/aerial.nvim
	use({
		"simrat39/symbols-outline.nvim",
		requires = "nvim-lspconfig",
		event = "BufWinEnter",
		after = "nvim-lspconfig",
		config = function()
			require("user.symbols-outline")
		end,
	})

	-- Colorschemes
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("user.onedark")
		end,
	}) -- https://github.com/navarasu/onedark.nvim colourscheme

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "BufRead",
		config = function()
			require("user.nvim-surround")
		end,
	})

	-- https://github.com/phaazon/hop.nvim#usage
	use({
		"phaazon/hop.nvim",
		--branch = "v2", -- optional but strongly recommended
		--[[ cmd = { ]]
		--[[ 	"HopWord", ]]
		--[[ 	"HopLine", ]]
		--[[ 	"HopChar1", ]]
		--[[ 	"HopChar2", ]]
		--[[ 	"HopPattern", ]]
		--[[ }, ]]
		event = "BufRead",
		as = "hop",
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("user.hop")
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("user.which-key")
		end,
		event = "VimEnter",
	})

	use({
		"jedrzejboczar/possession.nvim",
		requires = { "plenary.nvim" },
		config = function()
			require("user.possession")
		end,
	})

	use({
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		ft = { "python", "sh", "bash", "zsh", "javascript", "c", "cpp" },
		config = function()
			require("user.code-runner")
		end,
	})

	--https://github.com/iamcco/markdown-preview.nvim
	use({
		"frabjous/knap",
		config = function()
			require("user.knap")
		end,
		ft = { "markdown" },
	})

	use({
		"jghauser/follow-md-links.nvim",
		ft = { "markdown" },
	})

	--https://github.com/folke/trouble.nvim
	use({
		"folke/trouble.nvim",
		disable = true,
		requires = "kyazdani42/nvim-web-devicons",
		event = "BufWinEnter",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"Pocco81/auto-save.nvim",
        --[[ disable=true, ]]
		config = function()
			require("user.auto-save")
		end,
		event = "InsertLeavePre",
	})

	use({
		"Pocco81/true-zen.nvim",
		event = "BufRead",
		config = function()
			require("true-zen").setup({
				integrations = {
					tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
				},
			})
		end,
	})

	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		after = "nvim-lspconfig",
		config = function()
			require("user.navic")
		end,
	})
	--https://github.com/TimUntersberger/neogit
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim", disable = true })

	-- https://github.com/rcarriga/nvim-notify#Installation
	use({
		"rcarriga/nvim-notify",
		after = "alpha-nvim",
		config = function()
			vim.notify = require("notify")
		end,
	})

	-- https://github.com/nvim-neorg/neorg
	-- https://github.com/ray-x/navigator.lua
	-- https://github.com/stevearc/dressing.nvim
	-- https://github.com/nvim-pack/nvim-spectre
	-- https://github.com/kdheepak/lazygit.nvim
	-- https://github.com/nvim-treesitter/playground
	--
	use({
		"nvim-treesitter/playground",
		after = "nvim-treesitter",
        disable=true,
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
			})
		end,
	})

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
