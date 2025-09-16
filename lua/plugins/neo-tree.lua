return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
  },
  lazy = false,
  config = function()
    require('which-key').add({
      { '<leader>e', group = 'NeoTree', icon = ' ' },
      { '<leader>ec', ':Neotree current<cr>', desc = ' Current' },
      { '<leader>ee', ':Neotree focus<cr>', desc = ' Focus' },
      { '<leader>et', ':Neotree toggle<cr>', desc = ' Toggle' },
    })
  end,
  opts = {
    close_if_last_window = true,
    popup_border_style = 'solid',
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
      },
    },
    window = {
      width = 30,
      mappings = {
        ['l'] = 'toggle_node',
        ['<cr>'] = 'open',
        ['S'] = 'open_split',
        ['s'] = 'open_vsplit',
        ['t'] = 'open_tabnew',
        ['C'] = 'close_node',
        ['R'] = 'refresh',
        ['a'] = 'add',
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['x'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['q'] = 'close_window',
        ['?'] = 'show_help',
      },
    },
  },
}
