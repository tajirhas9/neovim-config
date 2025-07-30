local on_attach = require('tajirhas9.lsp.config').on_attach
local capabilities = require('tajirhas9.lsp.config').capabilities
local join_path = require('tajirhas9.constants').join_path

local vtsls_config = {
    on_attach = on_attach,  -- Call your original on_attach
    capabilities = capabilities,
    settings = {
        completions = {
            completeFunctionCalls = true
        },
        vtsls = {
            tsserver = {
                globalPlugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vim.fn.stdpath 'data' ..
                            join_path('mason', 'packages', 'vue-language-server', 'node_modules', '@vue', 'language-server'),
                        languages = { 'vue' },
                        configNamespace = 'typescript',
                        enableForWorkspaceTypeScriptVersions = true,
                    },
                },
            },
        },
    },
    filetypes = {
        "javascript",
        "typescript",
        "vue",
    },
    -- init_options = {
    -- },
}

vim.lsp.config('vtsls', vtsls_config)
