local cmp = require("cmp");
local lspconfig = require("lspconfig");

cmp.setup({
    -- Completion sources
    sources = {
        { name = 'nvim_lsp' },  -- LSP completions
        { name = 'buffer' },    -- Buffer completions
        { name = 'path' },      -- Path completions
    },

    mapping = cmp.mapping.preset.insert({
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    snippet = {
        expand = function(args)
            -- Use luasnip or vim-vsnip, whatever you prefer.
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
    },
});
