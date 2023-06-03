-- https://neovim.io/doc/user/lua.html#lua-keymap

vim.keymap.set({'i', 'v', 'n'}, '<C-f>', '<Right>')
vim.keymap.set({'i', 'v', 'n'}, '<C-b>', '<Left>')
vim.keymap.set({'i', 'v', 'n'}, '<C-n>', '<Down>')
vim.keymap.set({'i', 'v', 'n'}, '<C-p>', '<Up>')
vim.keymap.set({'i', 'v', 'n'}, '<C-e>', '<End>')
vim.keymap.set({'i', 'v', 'n'}, '<C-a>', '<Home>')

vim.keymap.set({'i', 'v', 'n'}, '<C-h>', '<BS>')
vim.keymap.set({'i', 'v', 'n'}, '<C-d>', '<Del>')

vim.keymap.set('i', '<C-k>', '<C-o>D')
vim.keymap.set('i', '<C-u>', '<C-o>d^')
vim.keymap.set('i', '<C-w>', '<C-o>db')

vim.keymap.set('n', '<C-c>', ':q<CR>')
vim.keymap.set('n', '<C-x>', ':wq<CR>')

vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', { desc = 'Search: Clear Search Highlight' })
