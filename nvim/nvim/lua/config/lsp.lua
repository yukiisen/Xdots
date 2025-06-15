local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup();

-- mason_lspconfig.setup_handlers({
--     function (server)
--         if server ~= "emmet_ls" and server ~= "lua_ls" and server ~= "rust_analyzer" then
--             lspconfig[server].setup({
--                 capabilities = capabilities,
--             });
--         end
--     end,
-- });

lspconfig.emmet_ls.setup({
    filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
});

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    }
});

lspconfig.rust_analyzer.setup({
    cmd = { vim.fn.trim( vim.fn.system("rustup which rust-analyzer") ) },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy"
            },
        }
    }
});

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("YukiLSPCfg", {}),
    callback = function (ev)
        local opts = { buffer = ev.buf };
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts);
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts);
    end
})


vim.diagnostic.config({
    virtual_text = {
        prefix = '●',  -- or '■', '▶', '>>', or "" for no prefix
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
