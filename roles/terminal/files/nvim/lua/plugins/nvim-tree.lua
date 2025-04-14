return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        view = {
          side = 'right',
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      }

      local api = require 'nvim-tree.api'
      vim.keymap.set('n', '<C-n>', api.tree.toggle, { desc = 'Open File Explorer' })
      vim.keymap.set('n', '<leader>e', api.tree.focus, { desc = 'Focus File Explorer' })
    end,
  },
}
