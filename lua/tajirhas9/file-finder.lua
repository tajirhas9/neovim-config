-- require'telescope'.setup{
--   defaults = {
--       file_ignore_patterns = {
--           "node_modules",
--           "%.git/",
--           "%.lock",
--           "%.umd.js%"
--       }
--   },
--   pickers = {
--     find_files = {
--       find_command = { "fd", "--type", "f", "--color", "never", "--no-require-git" }
--     }
--   }
--   -- ...
-- }
-- -- search files, even hidden ones
-- vim.keymap.set('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>', {})
-- -- ripgrep files, respects gitignore
-- vim.keymap.set('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', {})
-- vim.keymap.set('n', '<leader>;', ':lua require"telescope.builtin".buffers()<CR>', {})
-- vim.keymap.set('n', '<leader>fo', ':lua require"telescope.builtin".oldfiles()<CR>', {})
-- -- find in current buffers
-- vim.keymap.set('n', '<leader>fb',
--     ':lua require"telescope.builtin".find_files({ cwd = require"telescope.utils".buffer_dir() })<CR>', {})


vim.keymap.set('n', '<leader>ff', ':lua require"fzf-lua".files()<CR>', {})
vim.keymap.set('n', '<leader>fg', ':lua require"fzf-lua".live_grep()<CR>', {})
vim.keymap.set('n', '<leader>fm', ':lua require"fzf-lua".marks()<CR>', {})
vim.keymap.set('n', '<leader>;', ':lua require"fzf-lua".buffers()<CR>', {})
vim.keymap.set('n', '<leader>fo', ':lua require"fzf-lua".oldfiles()<CR>', {})
