-- Diagnostic Virtual Text Toggle for Neovim

local M = {}

-- Flag to track original virtual text state
M.original_virtual_text_config = true

-- Setup function to configure diagnostic behavior
function M.setup()
    -- Store the original virtual text configuration
    local orig_config = vim.diagnostic.config()
    M.original_virtual_text_config = orig_config.virtual_text

    vim.o.updatetime = 300
    -- Create an augroup for diagnostic hover management
    local diagnostic_hover_augroup = vim.api.nvim_create_augroup("DiagnosticHoverManagement", { clear = true })

    -- Disable virtual text when cursor holds over a diagnostic
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = diagnostic_hover_augroup,
        callback = function()
            -- vim.diagnostic.open_float()
        end
    })
end

vim.diagnostic.config({
    virtual_text = true, -- Show inline diagnostics by default
    signs = true,        -- Show signs (icons) in the gutter
    update_in_insert = true,
    float = {
        border = "rounded", -- Border style for the floating window
        source = "always",  -- Show the source of the diagnostic (e.g., LSP server)
        header = "",
        prefix = "",
    },
})

-- Expose the module functions
local diagnostic = M
diagnostic.setup()

function LspDiagnosticsFocus()
    vim.api.nvim_command('set eventignore=WinLeave')
    vim.api.nvim_command('autocmd CursorMoved <buffer> ++once set eventignore=""')
    vim.diagnostic.open_float(nil,
        { focusable = true, scope = 'line', close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinLeave" } })
end

vim.api.nvim_set_keymap('', '<leader>dd', '<Cmd>lua LspDiagnosticsFocus()<CR>', { silent = true })

require('package-info').setup({})

-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = "package.json",
--     callback = function()
--         vim.defer_fn(function()
--             require("package-info").show()
--         end, 100)
--     end,
--     desc = "Show package info when opening package.json"
-- })

local package_json_group = vim.api.nvim_create_augroup("PackageJsonKeymaps", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    group = package_json_group,
    callback = function()
        -- Check if the current file is package.json
        local filename = vim.fn.expand("%:t")
        if filename == "package.json" then
            local bufnr = vim.api.nvim_get_current_buf()
            vim.keymap.set("n", "<leader>pu", require("package-info").update, {
                buffer = bufnr,
                desc = "Update package on line",
                silent = true,
                noremap = true
            })
        end
    end
})
