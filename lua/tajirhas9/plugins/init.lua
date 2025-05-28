require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})

vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        numbers = "buffer_id",
    }
}
-- require('nvim-cursorline').setup {
--     cursorline = {
--         enable = false,
--         timeout = 1000,
--         number = false,
--     },
--     cursorword = {
--         enable = false,
--         min_length = 3,
--         hl = { underline = true },
--     }
-- }
require("Comment").setup()
require("colorizer").setup({ '*' })
