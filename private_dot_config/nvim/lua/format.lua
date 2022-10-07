-- Utilities for creating configurations
local util = require "formatter.util"

-- Format on Save

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    filetype = {
        go = {
            require("formatter.filetype.go").gofumpt
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}
