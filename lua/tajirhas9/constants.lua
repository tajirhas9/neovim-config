local FLUTTER_SDK_PATH = "/Users/tajirhas9/development/flutter/bin/flutter"
local DART_SDK_PATH = "/Users/tajirhas9/development/flutter/bin/cache/dart-sdk/bin/dart"

if vim.loop.os_uname().sysname == "Windows_NT" then
    FLUTTER_SDK_PATH = ""
    DART_SDK_PATH = ""
end

return {
    FLUTTER_SDK_PATH = FLUTTER_SDK_PATH,
    DART_SDK_PATH = DART_SDK_PATH
}
