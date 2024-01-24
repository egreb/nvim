-- move lines up and down
vim.api.nvim_set_keymap('n', '∆', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '˚', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '∆', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '˚', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '∆', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '˚', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

