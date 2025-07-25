local FLUTTER_SDK_PATH = "/Users/tajirhas9/development/flutter/bin/flutter"
local DART_SDK_PATH = "/Users/tajirhas9/development/flutter/bin/cache/dart-sdk/bin/dart"

if vim.loop.os_uname().sysname == "Windows_NT" then
    FLUTTER_SDK_PATH = "C:/Users/User/Work/dev/sdk/flutter.bat"
    DART_SDK_PATH = "C:/Users/User/Work/dev/sdk/flutter/bin/cache/dart-sdk.bat"
end

return {
    FLUTTER_SDK_PATH = FLUTTER_SDK_PATH,
    DART_SDK_PATH = DART_SDK_PATH
}
