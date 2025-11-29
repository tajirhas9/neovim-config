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

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew' }, {
    group = require "tajirhas9.constants".load_plugins_group,
    callback = function()
        require("Comment").setup()
        require("colorizer").setup({ '*' })
        require('nvim-autopairs').setup({
            disable_filetype = { "TelescopePrompt", "vim" },
        })
    end
})
