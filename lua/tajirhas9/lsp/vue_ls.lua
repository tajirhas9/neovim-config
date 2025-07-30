local on_attach = require('tajirhas9.lsp.config').on_attach
local capabilities = require('tajirhas9.lsp.config').capabilities
local join_path = require('tajirhas9.constants').join_path

local vue_ls_config = {
    on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider.full = true
       on_attach(client, bufnr)  -- Call your original on_attach
    end,
    capabilities = capabilities,
    settings = {
        typescript = {
            tsdk = vim.fn.getcwd() .. join_path('node_modules', 'typescript', 'lib')
        },
        vue = {
            codeLens = {
                references = true,
                pugReferences = true,
                scriptSetupSupport = true,
            },
        },
    },
}

vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.enable({'vtsls', 'vue_ls'})
