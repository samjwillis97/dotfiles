require("packages")
require("lsp")
require("treesitter")
require("filetree")
require("statusline")
require("telescope-settings")
require("neogit-settings")
-- require("debugger")
-- require("format")
require("settings")

-- require("onedark").setup {
-- 	style = 'darker'
-- }
-- require("onedark").load()
--

vim.g.catpuccin_flavour = "macchiato"
require("catpuccin").setup()
vim.cmd [[colorscheme catpuccin]]
