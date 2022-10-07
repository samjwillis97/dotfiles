-- Utilities for creating configurations
local util = require "formatter.util"

-- Format on Save
-- augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost * FormatWrite
-- augroup END
local formatGroup = vim.api.nvim_create_augroup("FormatAutogroup", {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
    command = "FormatWrite",
    pattern = "*",
    group = formatGroup,
})

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    filetype = {
        go = {
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
