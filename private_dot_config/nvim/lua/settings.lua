vim.g.mapleader = "\\"

-- Standard Config
vim.opt.encoding = "utf-8"
vim.opt.errorbells = false
vim.opt.updatetime = 50
vim.opt.shortmess:append("c") -- Why??

-- Swap Files
vim.opt.swapfile = true
vim.opt.dir = "/tmp"

-- User Interface
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cmdheight = 2
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.lazyredraw = true -- Why?
vim.opt.showmatch = true -- Why?

-- Folding
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "indent"

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true


-- Insert Mode Remaps
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Normal Mode Remaps
---- Clear search highlights
vim.api.nvim_set_keymap("n", "<leader><space>", ":nohlsearch<CR>", {})
---- Reload VIMRC
vim.api.nvim_set_keymap("n", "<leader>R", ":source $MYVIMRC<CR>", {})
---- Navigate between splits
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", { noremap = true })
---- NVIMTree
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true})
---- Code Navigation


-- Chezmoi
vim.api.nvim_create_autocmd("BufWritePost",{
	pattern = "~/.local/share/chezmoi/*",
	command = "chezmoi apply --source-path \"%\"",
})

-- Reopening A File - at same line (TODO)

