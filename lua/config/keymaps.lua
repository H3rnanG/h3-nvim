vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', ':quita<CR>', { desc = 'Quit All' })

vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { desc = 'Open Lazy' })

-- Fzf
vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', { desc = 'Buffers' })