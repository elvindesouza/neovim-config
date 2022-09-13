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
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
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
		after = "nvim-ts-context-commentstring",
		config = function()
			require("user.comment")
		end,
	})
	use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })
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
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		after = "nvim-web-devicons",
		config = function()
			require("user.bufferline")
		end,
	})
	use({ "moll/vim-bbye" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },

		setup = function()
			require("user.lualine")
		end,
	})
	use({
		"akinsho/toggleterm.nvim",
		event = "BufReadPre",
		setup = function()
			require("user.toggleterm")
		end,
	})
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		cmd = "IndentBlanklineRefresh",
		setup = function()
			require("user.indentline")
		end,
	})
	use({ "goolord/alpha-nvim", requires = { "kyazdani42/nvim-web-devicons" } })

	-- cmp plugins
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{
				"hrsh7th/cmp-nvim-lsp-signature-help",
				after = "nvim-cmp",
			},
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "lukas-reineke/cmp-under-comparator", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
			event = "InsertEnter",
			after = "LuaSnip",
		},
		event = "InsertEnter",
		config = function()
			require("user.cmp")
		end,
	}) -- The completion plugin
	--use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	--use({ "hrsh7th/cmp-path" }) -- path completions
	--use({ "hrsh7th/cmp-cmdline" }) -- command line completions
	--use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	--use({ "hrsh7th/cmp-nvim-lsp" })
	--use({ "hrsh7th/cmp-nvim-lua" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", event = "InsertEnter" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", event = "InsertEnter" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	--[[ use { "williamboman/nvim-lsp-installer"} -- simple to use language server installer ]]
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({
		"RRethy/vim-illuminate",
		event = "BufRead",
		setup = function()
			require("user.illuminate")
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		after = { "plenary.nvim" },
		cmd = "Telescope",
		module = "telescope",
		setup = function()
			require("user.telescope")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		--event = "BufReadPre",
		config = function()
			require("user.treesitter")
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		after = "plenary.nvim",
		config = function()
			require("user.gitsigns")
		end,
	})

	-- DAP
	use({
		"mfussenegger/nvim-dap",
		cmd = { "BreakpointToggle", "Debug", "DapREPL" },
		setup = function()
			require("user.dap")
		end,
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, after = "nvim-dap" })
	use({ "ravenxrz/DAPInstall.nvim" }) -- Automatically set up your configuration after cloning packer.nvim

	-- Symbol Tree
	use({
		"simrat39/symbols-outline.nvim",
		requires = "nvim-lspconfig",
		after = "nvim-lspconfig",
		setup = function()
			require("user.symbols-outline")
		end,
	})

	-- Colorschemes
	use({
		"navarasu/onedark.nvim",
		setup = function()
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

	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		cmd = {
			"HopWord",
			"HopLine",
			"HopChar1",
			"HopChar2",
			"HopPattern",
		},
		as = "hop",
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("user.hop")
		end,
	})

	use({
		"folke/which-key.nvim",
	})

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
