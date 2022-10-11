-- Packer
---- Autoinstallation
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    -- The NeoVIM must haves
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run ='make' }
    use('nvim-treesitter/nvim-treesitter', {
        run = ":TSUpdate"
    })
    use 'romgrk/nvim-treesitter-context' -- Shows the current function/class as float window (Not Working)
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
    use {'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end}
    -- use 'TimUntersberger/neogit'
    -- The VIM must haves
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'christoomey/vim-tmux-navigator'
    -- Formatter
    use 'mhartington/formatter.nvim'
    -- Colorschemes
    use 'gruvbox-community/gruvbox'
    use 'Mofiqul/dracula.nvim'
    use 'navarasu/onedark.nvim'
    use 'catppuccin/nvim'
    -- Icons
    use {'kyazdani42/nvim-web-devicons', config = function() require("nvim-web-devicons").setup { default = true; } end}

    -- Show Colors
    use 'norcalli/nvim-colorizer.lua'
    -- Statuslines
    use {
        'nvim-lualine/lualine.nvim',
    }
    -- File Navigation
    use {
        'kyazdani42/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    } 
    -- Language Server Protocol
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim' -- Auto LSP Installs
    -- Language Server Protocol with Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim'
    -- VSnip 
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- Outline
    use 'simrat39/symbols-outline.nvim' -- Maybe fix some bindings?
    -- -- Keep Cursor in the same place
    -- use 'zhimsel/vim-stay'
    -- -- DAP (Debug Adapter Protocol)
    -- use 'mfussenegger/nvim-dap'
    -- use 'rcarriga/nvim-dap-ui'
    -- use 'theHamsta/nvim-dap-virtual-text'
    -- -- Fancy Lines
    use 'lukas-reineke/indent-blankline.nvim'
    -- -- Cursor
    use 'ethanholz/nvim-lastplace'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
