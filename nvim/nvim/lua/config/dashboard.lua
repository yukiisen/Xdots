local ascii_art = require("yuki.ascii");

local header_s = ascii_art.normal;

local doom_config = {
    theme = 'doom',
    config = {
        header = header_s,
        center = {
        {
            icon = ' ',
            desc = ' New File        ',
            key = 'n',
            key_format = ' %s',
            action = 'new'
        },
        {
            icon = ' ',
            desc = ' Find File',
            key = 'f',
            key_format = ' %s',
            action = 'Telescope find_files'
        },
        -- {
        --     icon = ' ',
        --     desc = 'Browse Files',
        --     key = 'e',
        --     key_format = ' %s',
        --     action = 'NTT'
        -- },
        -- {
        --     icon = ' ',
        --     desc = 'Recent Files',
        --     key = 'r',
        --     key_format = ' %s',
        --     action = 'Telescope oldfiles'
        -- },
        -- {
        --     icon = ' ',
        --     desc = ' Edit Config',
        --     key = 'c',
        --     key_format = ' %s',
        --     action = 'e $MYVIMRC'
        -- },
        -- {
        --     icon = ' ',
        --     desc = 'Plugin Manager',
        --     key = 'p',
        --     key_format = ' %s',
        --     action = 'Lazy'
        -- },
        {
            icon = ' ',
            desc = ' Quit Neovim',
            key = 'q',
            key_format = ' %s',
            action = 'qa'
        },
        },
    }
}

local hyper_config = {
    theme = 'hyper',
    config = {
        header = header_s,
        shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
        },
    }
}

return { hyper_config, doom_config };
