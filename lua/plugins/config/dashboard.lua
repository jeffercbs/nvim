local options = {
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      {
        icon = ' ',
        desc = 'Update',
        group = '@property',
        action = 'Lazy update',
        key = 'u'
      },
      {
        icon = ' ',
        desc = "New File",
        action = "ene",
        key = 'n',
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = " ",
        desc = 'Quit',
        group = 'Number',
        action = 'qa',
        key = 'q',
      },
    },
    footer = {
      'Neovim config by @jeffercbs',
    },
  },
}

return options