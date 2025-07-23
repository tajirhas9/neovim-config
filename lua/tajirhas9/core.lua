vim.wo.number = true         -- Show line numbers
vim.wo.relativenumber = true -- Show relative line number
vim.cmd [[set mouse=a]]      -- Mouse active
vim.o.tabstop = 4            -- A TAB character looks like 4 spaces
vim.o.expandtab = true       -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4        -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4         -- Number of spaces inserted when indenting

vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

map('n', '<leader>pw', [[:Neotree toggle<CR>]], {})

-- jump to older cursor position
map('n', '<M-Left>', '<C-o>', { noremap = true, silent = true })


-- jump to newer cursor position
map('n', '<M-Right>', '<C-i>', { noremap = true, silent = true })


-- cursor to center when scrolling
map('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
map('n', '<C-[>', '<CMD>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
map('n', '<C-]>', '<CMD>BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', '<Esc>', '<CMD><CR>', { noremap = true, silent = true })
