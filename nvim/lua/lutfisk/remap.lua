
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'>-2<CR>gv=gv')

vim.keymap.set('n', 'J', 'mzJ`z')

vim.keymap.set({'n', 'v'}, '<leader>d', '"_d')
vim.keymap.set({'n', 'v'}, '<leader>D', '"_D')
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>j', 'yyp')

vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<leader>mr', '<cmd>!make run<CR>')
vim.keymap.set('n', '<leader>mk', '<cmd>!make<CR>')
vim.keymap.set('n', '<leader>mi', '<cmd>!make install<CR>')

vim.keymap.set('n', '<leader>gs', '<cmd>!git status<CR>')
vim.keymap.set('n', '<leader>gl', '<cmd>!git log<CR>')
vim.keymap.set('n', '<leader>gb', '<cmd>!git branch<CR>')
vim.keymap.set('n', '<leader>gd', '<cmd>!git diff<CR>')

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')

