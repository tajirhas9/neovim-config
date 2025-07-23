-- global vim
local dap = require('dap')
local dapui = require('dapui')

local FLUTTER_SDK_PATH = require("tajirhas9.constants").FLUTTER_SDK_PATH
local DART_SDK_PATH = require("tajirhas9.constants").DART_SDK_PATH

-- Open dapui automatically when a new debug session is created
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Debugger speicific keymaps
vim.keymap.set('n', '<leader>5', function() dap.continue() end)
vim.keymap.set('n', '<leader>6', function() dap.step_over() end)
vim.keymap.set('n', '<leader>7', function() dap.step_into() end)
vim.keymap.set('n', '<leader>8', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
    function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.toggle() end)
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


vim.keymap.set('n', '<leader>du', function() dapui.toggle() end)
