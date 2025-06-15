local dash_config = require("config.dashboard");
local doom_config = dash_config[2];

require("lazy").setup({
    {'dylanaraps/wal.vim', lazy = false, priority = 1000 },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Fuzzy Finder (Telescope)
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
            require("config.telescope").setup();
            require("config.telescope").bindings();
        end
    },

    -- Statusline (lualine)
    {'nvim-lualine/lualine.nvim'},

    -- Tree-sitter (syntax highlighting)
    {
	    'nvim-treesitter/nvim-treesitter',
	    run = ':TSUpdate',
    	config = function()
	        require("config.treesitter").setup();
	    end
    },

    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup(doom_config);
	    end,
    },

    -- auto close brackets
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    { 'tpope/vim-commentary' },

    {
        'neovim/nvim-lspconfig',
        config = function()
            require("config.lsp") -- we’ll create this module
        end
    },

    {
        'williamboman/mason.nvim',
        build = ":MasonUpdate",
        config = true
    },

    -- Mason LSP Bridge
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup()
        end
    },

    {
        'hrsh7th/nvim-cmp', -- Main completion plugin
        config = function()
            require("config.completions")
        end
    },

    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },

    -- Snippet engine
    { 'L3MON4D3/LuaSnip' },
});


-- File Explorer Setup 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = false

require("nvim-tree").setup()


-- Status line setup
require('lualine').setup {
    options = {
        theme = "pywal"
    }
}

-- My settings
require("yuki.settings")();
