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

    -- cool cursor
    {
        'sphamba/smear-cursor.nvim',
        opts = {
            -- Smear cursor when switching buffers or windows.
            smear_between_buffers = true,
            -- Smear cursor when moving within line or to neighbor lines.
            -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
            smear_between_neighbor_lines = true,
            -- Draw the smear in buffer space instead of screen space when scrolling
            scroll_buffer_space = true,
            -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
            -- Smears will blend better on all backgrounds.
            legacy_computing_symbols_support = false,
            -- Smear cursor in insert mode.
            -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
            smear_insert_mode = true,
        }
    },

    -- {
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     opts = {},
    --     config = function ()
    --         require('render-markdown').setup({
    --             completions = { lsp = { enabled = true } },
    --         });
    --     end
    -- }
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
