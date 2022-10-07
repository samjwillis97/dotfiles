-- Utilities for creating configurations
local util = require "formatter.util"

-- Format on Save

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    filetype = {
        go = {
            -- gofmt
            -- function () return {
            --     exe = "gofmt",
            --     args = {},
            --     stdin = true,
            -- }
	    -- end
            -- gofumpt
            function () return {
                exe = "gofumpt",
                args = {},
                stdin = true,
                } 
            end
        },
    }
}
