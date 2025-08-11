vim.keymap.set('n', '<leader>qq', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>qa', ':quita<CR>', { desc = 'Quit All' })
vim.keymap.set('n', '<leader>qb', ':bd<CR>', { desc = 'Quit Buffer' })

vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { desc = 'Open Lazy' })
vim.keymap.set('n', '<leader>m', ':Mason<CR>', { desc = 'Open Mason' })

-- Fzf
vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', ':FzfLua helptags<CR>', { desc = 'Help Tags' })