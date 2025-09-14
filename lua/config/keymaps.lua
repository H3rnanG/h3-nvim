vim.keymap.set('n', '<leader>qq', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>qQ', ':q!<CR>', { desc = 'Quit Force' })
vim.keymap.set('n', '<leader>qa', ':quita<CR>', { desc = 'Quit All' })
vim.keymap.set('n', '<leader>qa', ':quita!<CR>', { desc = 'Quit All Force' })
vim.keymap.set('n', '<leader>qb', ':bd<CR>', { desc = 'Quit Buffer' })

-- Lazy
vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { desc = 'Open Lazy' })

-- Fzf
vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', ':FzfLua helptags<CR>', { desc = 'Help Tags' })

-- Move
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Others
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
