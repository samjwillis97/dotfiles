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
        typescript = {
            require("formatter.filetypes.typescript").prettier
        },
        javascript = {
            require("formatter.filetypes.javascript").prettier
        },
        svelte = {
            require("formatter.filetypes.svelte").prettier
        },
        json = {
            require("formatter.filetypes.json").prettier
        },
        yaml = {
            require("formatter.filetypes.yaml").prettier
        },
        python = {
            require("formatter.filetypes.python").black
        },
        html = {
            require("formatter.filetypes.html").prettier
        },
        lua = {
            require("formatter.filetypes.lua").stylua
        },
        rust = {
            require("formatter.filetypes.rust").rustfmt
        }
    }
}
