function setup ()
    -- Key bindings
    vim.api.nvim_create_user_command("NTT", "NvimTreeToggle", {})
    vim.api.nvim_create_user_command("W", "w", {})
    vim.api.nvim_create_user_command("Q", "q", {})

    vim.api.nvim_set_keymap('n', 'tt', '<Cmd>tabnew<CR>', { noremap = true, silent = true });


    -- my settings

    vim.cmd.colorscheme("wal");

    -- Line numbers
    vim.wo.number = true
    vim.wo.relativenumber = true

    vim.o.mouse = 'a'
    vim.o.clipboard = 'unnamedplus'

    -- Tabs and indentation settings
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
    vim.o.smartindent = true

    -- Search settings
    vim.o.ignorecase = true
    vim.o.smartcase = true
    vim.o.hlsearch = true
    vim.o.incsearch = true

    vim.o.undofile = true

    -- Scrolling settings
    vim.o.scrolloff = 10
    vim.cmd("syntax enable")
    vim.cmd("filetype plugin indent on")
end 


return setup;
