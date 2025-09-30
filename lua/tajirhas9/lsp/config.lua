local mason_lspconfig = require("mason-lspconfig")

-- Show current code context
-- local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
    -- format on save
    if client.name == "vtsls" then
        vim.cmd([[command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')]]) -- Format
    end
    if client.name == 'dartls' then
        vim.cmd([[command! -nargs=0 DartFormat :call CocAction('runCommand', 'dart.format')]]) -- Format
    end
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
            buffer = bufnr,
            callback = function()
                print("Formatting document on save")
                vim.lsp.buf.format { bufnr = bufnr }
            end,
            desc = '[lsp] format on save',
        })
        -- navic.attach(client, bufnr)
    end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = true,
    lineFoldingOnly = true,
    rangeLimit = 5000
}

return {
    on_attach = on_attach,
    capabilities = capabilities
}
