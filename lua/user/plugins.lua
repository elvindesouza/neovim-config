local fn = vim.fn

-- Install lazy.nvim
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

----------------------------------

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
lazy.setup({
	-- https://github.com/rockerBOO/awesome-neovim#project
	-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/plugins.lua
	-- https://github.com/search?l=Lua&o=desc&q=neovim+plugin&s=stars&type=Repositories
	-- https://astronvim.github.io/acknowledgements#plugins-used-in-astronvim
	-- https://www.lunarvim.org/docs/plugins/core-plugins-list
	-- https://neovimcraft.com/

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		lazy = true,
		config = function()
			require("user.autopairs")
		end,
	}, -- Autopairs, integrates with both cmp and treesitter

    
	{
		"numToStr/Comment.nvim",
		event = "InsertEnter",
		lazy = true,
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("user.comment")
		end,
	}, -- commenting plugin for neovim https://github.com/numToStr/Comment.nvim

	-- https://github.com/kyazdani42/nvim-tree.lua
	{
		"kyazdani42/nvim-tree.lua",
		lazy = true,
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		cmd = "NvimTreeToggle",
		config = function()
			require("user.nvim-tree")
		end,
		tag = "nightly", -- optional, updated every week.
	}, -- file explorer

	-- https://github.com/akinsho/bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		lazy = true,
		dependencies = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
		event = "BufReadPost",
		config = function()
			require("user.bufferline")
		end,
	}, -- buffer list(top bar) plugin

	{
		"moll/vim-bbye",
		event = "BufWinLeave",
		lazy = true,
	}, -- Delete buffers and close files in Vim without closing your windows or messing up your layout, written in vimscript

	-- https://github.com/nvim-lualine/lualine.nvim
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		dependencies = { "kyazdani42/nvim-web-devicons" },
		event = "BufReadPost",
		config = function()
			require("user.lualine")
		end,
	}, -- statusline plugin(bottom bar)

	-- https://github.com/akinsho/toggleterm.nvim
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		cmd = "ToggleTerm",
		config = function()
			require("user.toggleterm")
		end,
	}, -- embedded terminal

	{
		"ahmedkhalf/project.nvim",
		lazy = true,
		event = "BufRead",
		config = function()
			require("user.project")
		end,
	}, -- project management with Telescope integration

	-- https://github.com/lukas-reineke/indent-blankline.nvim
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = "VeryLazy",
		cmd = "IndentBlanklineRefresh",
		config = function()
			require("user.indentline")
		end,
	}, -- adds indentation guides

	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", "ahmedkhalf/project.nvim" },
		config = function()
			require("user.alpha")
		end,
	}, -- startup screen

	-- Autocompletion --
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
				"hrsh7th/cmp-nvim-lsp-signature-help",
				enabled = false,
			},
			{
				-- https://github.com/ray-x/lsp_signature.nvim
				"ray-x/lsp_signature.nvim",
				config = function()
					require("user.lsp-signature")
				end,
			},
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "lukas-reineke/cmp-under-comparator" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
		},
		event = "InsertEnter",
		config = function()
			require("user.cmp")
		end,
	}, -- Autocompletion

	-- LSP ----------------------
	{
		"williamboman/mason.nvim",
		lazy = true,
		config = function()
			require("user.lsp.mason")
		end,
	}, -- package manager for Neovim - install and manage LSP servers, DAP servers, linters, and formatters.

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		event = "BufRead",
		config = function()
			require("user.lsp.lspconfig")
		end,
	}, -- bridges mason.nvim with the lspconfig plugin

	{
		"neovim/nvim-lspconfig",
		lazy = true,
		dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			require("user.lsp.handlers").setup()
		end,
	}, -- Configs for the Nvim LSP client

	{
		"nvimtools/none-ls.nvim",
		lazy = true,
		event = "BufReadPost",
		config = function()
			require("user.lsp.null-ls")
		end,
	}, -- for formatters and linters. Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

	{
		"RRethy/vim-illuminate",
		lazy = true,
		config = function()
			require("user.illuminate")
		end,
	}, -- highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching

	-- https://github.com/nvim-telescope/telescope.nvim
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		module = "telescope",
		config = function()
			require("user.telescope")
		end,
	}, -- Telescope- fuzzy finder over lists. builtin pickers, sorters and previewers

	-- Treesitter -----------------
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		dependencies = {
			{ --deprecated
				"p00f/nvim-ts-rainbow",
			},
			{
				-- context of the currently visible buffer contents
				"nvim-treesitter/nvim-treesitter-context",
				lazy = true,
				cmd = "TSContextToggle",
				config = function()
					require("user.ts-context")
				end,
			},
			{
				--https://github.com/nvim-treesitter/nvim-treesitter-textobjects
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
		},
		event = "VimEnter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("user.treesitter")
		end,
	},

	-- https://github.com/windwp/nvim-ts-autotag
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		event = "InsertEnter",
	}, -- auto close and auto rename html tag

	{
		"abecodes/tabout.nvim",
		event = "InsertEnter",
		lazy = true,
		config = function()
			require("user.tabout")
		end,
		dependencies = { "nvim-treesitter" }, -- or require if not used so far
	}, -- tabbing out from parentheses, quotes, and similar contexts

	-- https://github.com/lewis6991/gitsigns.nvim
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		dependencies = "nvim-lua/plenary.nvim",
		event = "VeryLazy",
		config = function()
			require("user.gitsigns")
		end,
	}, -- git decorations

	-- DAP ---------------
	-- https://github.com/mfussenegger/nvim-dap
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		enabled = false,
		cmd = { "BreakpointToggle", "Debug", "DapREPL" },
		config = function()
			require("user.dap")
		end,
	}, -- Debug Adapter Protocol client implementation for Neovim

	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		enabled = false,
		dependencies = { "mfussenegger/nvim-dap" },
	}, -- A UI for nvim-dap

	-- Automatically set up your configuration
	-- managing several debuggers for Nvim-dap
	{
		"ravenxrz/DAPInstall.nvim",
		lazy = true,
		enabled = false,
	},

	-- Symbol Tree
	-- https://github.com/simrat39/symbols-outline.nvim is now archived
	-- https://github.com/stevearc/aerial.nvim

	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("user.onedark")
		end,
	}, -- https://github.com/navarasu/onedark.nvim colourscheme

	{
		"kylechui/nvim-surround",
		lazy = true,
		version = "*",
		event = "BufRead",
		config = function()
			require("user.nvim-surround")
		end,
	}, -- Add/change/delete surrounding delimiter pairs

	-- https://github.com/phaazon/hop.nvim#usage
	{
		"phaazon/hop.nvim",
		lazy = true,
		event = "BufRead",
		cmd = { "HopWordMW", "HopLineStartMW", "HopAnywhereMW", "HopPattern" },
		as = "hop",
		config = function()
			require("user.hop")
		end,
	}, -- Neovim motions on speed!

	{
		"folke/which-key.nvim",
		lazy = true,
		config = function()
			require("user.which-key")
		end,
		event = "VimEnter",
	}, -- popup with possible key bindings of the command you started typing

	{
		"jedrzejboczar/possession.nvim",
		lazy = true,
        enabled=false,
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("user.possession")
		end,
	}, -- session management

	{
		"CRAG666/code_runner.nvim",
		lazy = true,
		enabled = false,
		dependencies = "nvim-lua/plenary.nvim",
		ft = { "python", "sh", "bash", "zsh", "javascript", "c", "cpp" },
		config = function()
			require("user.code-runner")
		end,
	}, -- code runner

	--https://github.com/iamcco/markdown-preview.nvim
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		enabled = false,
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		config = function()
			require("user.markdown-preview")
		end,
	},

	{
		"jghauser/follow-md-links.nvim",
		lazy = true,
		enabled = false,
		ft = { "markdown" },
	},

	--https://github.com/folke/trouble.nvim
	{
		"folke/trouble.nvim",
		lazy = true,
		dependencies = "kyazdani42/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			require("user.trouble")
		end,
	},

	{
		"Pocco81/true-zen.nvim",
		lazy = true,
		enabled = false,
		cmd = "TZMinimalist",
		config = function()
			require("user.true-zen")
		end,
	},

	
	{
		"TimUntersberger/neogit",
		lazy = true,
		event = "VeryLazy",
		dependencies = "nvim-lua/plenary.nvim",
		enabled = false,
	},--https://github.com/TimUntersberger/neogit

	{
		"max397574/better-escape.nvim",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("user.better_escape")
		end,
	},

	{ "folke/neodev.nvim", lazy = true, ft = { "lua" } },

	{
		
		"norcalli/nvim-colorizer.lua",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end,
	},--A high-performance color highlighter for Neovim which has no external dependencies

	{
		
		"folke/noice.nvim",
		lazy = true,
		config = function()
			require("user.noice")
		end,
		event = "BufReadPost",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			{
				"rcarriga/nvim-notify",
				config = function()
					require("user.notify")
				end,
			},
		},
	},--Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.

	-- https://github.com/nvim-neorg/neorg
	-- https://github.com/ray-x/navigator.lua
	-- https://github.com/stevearc/dressing.nvim
	-- https://github.com/nvim-pack/nvim-spectre
	-- https://github.com/kdheepak/lazygit.nvim
})
