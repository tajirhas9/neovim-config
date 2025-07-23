local on_attach = require('tajirhas9.lsp.config').on_attach
local capabilities = require('tajirhas9.lsp.config').capabilities

local dap = require('dap')

require("flutter-tools").setup {
    debugger = {
        enabled = false,
        register_configurations = function(_)
            dap.adapters.dart = {
                type = 'executable',
                command = 'dart', -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
                args = { 'debug_adapter' },
                -- windows users will need to set 'detached' to false
                options = {
                    detached = false,
                }
            }
            dap.adapters.flutter = {
                type = 'executable',
                command = 'flutter', -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
                args = { 'debug_adapter' },
                -- windows users will need to set 'detached' to false
                options = {
                    detached = false,
                }
            }
        end
    },
    on_attach = on_attach,
    capabilities = capabilities
}

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
    function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
