local config = require("nvim-treesitter.configs");

local M = {};

M.setup = function ()
    config.setup({
        highlight = {
            enable = true,
            disable = {},
        },
        indent = {
            enable = true,
        },
    })
end 

return M;
