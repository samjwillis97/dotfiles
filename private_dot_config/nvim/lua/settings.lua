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

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Folding
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "indent"

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Chezmoi
vim.api.nvim_create_autocmd("BufWritePost",{
	pattern = "~/.local/share/chezmoi/*",
	command = "chezmoi apply --source-path \"%\"",
})

-- Autoclose VIM if Tree is the last window
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

-- Reopening A File - at same line (TODO)


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
---- Telescope
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>F", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":Telescope help_tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>B", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>o", ":SymbolsOutline<CR>", { noremap = true })
---- Code Navigation + LSP
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { noremap = true })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { noremap = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { noremap = true })

