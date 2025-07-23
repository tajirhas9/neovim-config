require("mason").setup()
require("mason-lspconfig").setup({})


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>ds', ':lua require"telescope.builtin".lsp_document_symbols()<CR>', opts)
        vim.keymap.set('n', '<leader>ws', ':lua require"telescope.builtin".lsp_workspace_symbols()<CR>', opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts) -- Rename the variable. replaces all the variable names with the renamed one
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", {}),
            buffer = ev.buf,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end
        })
    end,
})

-- local nvim_lsp = require("lspconfig")
-- local mason_lspconfig = require("mason-lspconfig")
--
-- -- Show current code context
-- -- local navic = require("nvim-navic")
--
-- local on_attach = function(client, bufnr)
--     -- format on save
--     if client.name == "tsserver" then
--         vim.cmd([[command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')]]) -- Format
--     end
--     if client.supports_method("textDocument/formatting") then
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
--             buffer = bufnr,
--             callback = function()
--                 print("Formatting document on save")
--                 vim.lsp.buf.format { bufnr = bufnr }
--             end,
--             desc = '[lsp] format on save',
--         })
--         -- navic.attach(client, bufnr)
--     end
-- end
--
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }

-- DEPRECATED
-- mason_lspconfig.setup_handlers({
--     function(server)
--         nvim_lsp[server].setup({
--             capabilities = capabilities,
--             on_attach = on_attach
--         })
--     end
-- })
require("tajirhas9.lsp.lua_ls")
require("tajirhas9.lsp.vtsls")
require("tajirhas9.lsp.vue_ls")
require('tajirhas9.lsp.flutter')
-- require("tajirhas9.lsp.tsserver")
-- require("tajirhas9.lsp.volar")
