require("packages")
require("lsp")
require("treesitter")
require("filetree")
require("statusline")
require("telescope-settings")
require("neogit-settings")
-- require("debugger")
require("format")
require("settings")

-- require("onedark").setup {
-- 	style = 'darker'
-- }
-- require("onedark").load()
--

vim.g.catppuccin_flavour = "macchiato"
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]
require'colorizer'.setup()
