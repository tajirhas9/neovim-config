local FLUTTER_SDK_PATH = "/Users/tajirhas9/development/flutter/bin/flutter"
local DART_SDK_PATH = "/Users/tajirhas9/development/flutter/bin/cache/dart-sdk/bin/dart"
local FLUTTER_COMMAND = 'flutter'
local DART_COMMAND = 'dart'

if vim.loop.os_uname().sysname == "Windows_NT" then
    FLUTTER_SDK_PATH = "C:/Users/User/Work/dev/sdk/flutter"
    DART_SDK_PATH = "C:/Users/User/Work/dev/sdk/flutter/bin/cache/dart-sdk"
    FLUTTER_COMMAND = 'C:/Users/User/Work/dev/sdk/flutter/bin/flutter.bat'
    DART_COMMAND = 'C:/Users/User/Work/dev/sdk/flutter/bin/cache/dart-sdk/bin/dart.exe'
end

local function join_path(...)
    local components = { ... }
    local separator = package.config:sub(1, 1)
    local result = {}
    for _, comp in ipairs(components) do
        if comp ~= "" then
            table.insert(result, comp)
        end
    end
    return '/' .. table.concat(result, separator)
end

local load_plugins_group = vim.api.nvim_create_augroup('load_plugins', { clear = true })

return {
    FLUTTER_SDK_PATH = FLUTTER_SDK_PATH,
    DART_SDK_PATH = DART_SDK_PATH,
    FLUTTER_COMMAND = FLUTTER_COMMAND,
    DART_COMMAND = DART_COMMAND,
    join_path = join_path,
    load_plugins_group = load_plugins_group,
}
