local actions = require("telescope.actions");
local M = {};

M.bindings = function ()
    vim.api.nvim_set_keymap('n', 'f', '<Cmd>Telescope find_files<CR>', { noremap = true, silent = true });
    vim.api.nvim_set_keymap('n', 'gf', '<Cmd>Telescope git_files<CR>', { noremap = true, silent = true });
    vim.api.nvim_set_keymap('n', 'Fg', '<Cmd>Telescope live_grep<CR>', { noremap = true, silent = true });
    vim.api.nvim_set_keymap('n', 'Fb', '<Cmd>Telescope buffers<CR>', { noremap = true, silent = true });
end

M.setup = function ()
    require('telescope').setup{
        defaults = {
            mappings = {
                i = {
                    ["<Esc>"] = actions.close,
                },
                n = {},
            },
        },
    };
end

return M;
