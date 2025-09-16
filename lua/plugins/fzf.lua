return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim'
  },
  opts = {},
  config = function()
    require('which-key').add({
      { '<leader>f', group = 'Fzf' },
      { '<leader>ff', ':FzfLua files<cr>', desc = ' Find Files' },
      { '<leader>fg', ':FzfLua live_grep<cr>', desc = ' Live Grep' },
      { '<leader>fb', ':FzfLua buffers<cr>', desc = ' Buffers' },
      { '<leader>fh', ':FzfLua helptags<cr>', desc = ' Help Tags' },
    }, { prefix = '<leader>' })
  end,
}
