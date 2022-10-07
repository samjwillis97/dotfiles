-- Utilities for creating configurations
local util = require "formatter.util"

-- Format on Save

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    go = {
        function () return {
            exe = "gofumpt"
            } 
        end
    },
    ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace
    }
}
}
