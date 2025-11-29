local M = {}
M.setup = function()
    local FLUTTER_SDK_PATH = require("tajirhas9.constants").FLUTTER_SDK_PATH
    local DART_SDK_PATH = require("tajirhas9.constants").DART_SDK_PATH
    local FLUTTER_COMMAND = require('tajirhas9.constants').FLUTTER_COMMAND
    local DART_COMMAND = require('tajirhas9.constants').DART_COMMAND
    local on_attach = require('tajirhas9.lsp.config').on_attach
    local capabilities = require('tajirhas9.lsp.config').capabilities
    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

    local dap = require('dap')

    require("flutter-tools").setup {
        debugger = {
            enabled = true,
            register_configurations = function(_)
                dap.configurations.dart = {
                    {
                        type = "dart",
                        request = "launch",
                        name = "Launch dart",
                        dartSdkPath = DART_SDK_PATH,                  -- ensure this is correct
                        flutterSdkPath = FLUTTER_SDK_PATH,            -- ensure this is correct
                        program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "flutter",
                        request = "launch",
                        name = "Launch flutter",
                        dartSdkPath = DART_SDK_PATH,                  -- ensure this is correct
                        flutterSdkPath = FLUTTER_SDK_PATH,            -- ensure this is correct
                        program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
                        cwd = "${workspaceFolder}",
                    }
                }

                dap.adapters.dart = {
                    type = 'executable',
                    command = DART_COMMAND, -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
                    args = { 'debug_adapter' },
                    -- windows users will need to set 'detached' to false
                    options = {
                        detached = is_windows == false,
                    }
                }
                dap.adapters.flutter = {
                    type = 'executable',
                    command = FLUTTER_COMMAND, -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
                    args = { 'debug_adapter' },
                    -- windows users will need to set 'detached' to false
                    options = {
                        detached = is_windows == false,
                    }
                }
            end,
            flutter_path = FLUTTER_SDK_PATH,
            dev_log = {
                enabled = false
            },
            dev_tools = {
                autostart = true,
                auto_openbrowser = true
            }
        },
        on_attach = on_attach,
        capabilities = capabilities
    }


    vim.keymap.set('n', 'Fr', [[:FlutterReload<CR>]], {})
    vim.keymap.set('n', 'FR', [[:FlutterRestart<CR>]], {})
end

vim.api.nvim_create_autocmd({ 'FileType' }, {
    group = require("tajirhas9.constants").load_plugins_group,
    pattern = { '*.dart' },
    callback = function()
        M.setup()
    end
})
