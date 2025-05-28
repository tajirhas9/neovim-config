-- search files, even hidden ones
vim.keymap.set('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>', {})
-- ripgrep files, respects gitignore
vim.keymap.set('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', {})
vim.keymap.set('n', '<leader>;', ':lua require"telescope.builtin".buffers()<CR>', {})
vim.keymap.set('n', '<leader>fo', ':lua require"telescope.builtin".oldfiles()<CR>', {})
-- find in current buffers
vim.keymap.set('n', '<leader>fb',
    ':lua require"telescope.builtin".find_files({ cwd = require"telescope.utils".buffer_dir() })<CR>', {})
