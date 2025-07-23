local on_attach = require('tajirhas9.lsp.config').on_attach
local capabilities = require('tajirhas9.lsp.config').capabilities


local ts_ls_config = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        completions = {
            completeFunctionCalls = true
        },
        typescript = {
            tsserver = {
                useSyntaxServer = false,
            },
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
    filetypes = {
        "javascript",
        "typescript",
        "vue",
    },
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = vim.fn.stdpath 'data' ..
                    '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                languages = { 'vue' },
            },
        },
    },
}


vim.lsp.config('ts_ls', ts_ls_config)
