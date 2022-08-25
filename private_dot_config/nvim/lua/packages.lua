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
  use('nvim-treesitter/nvim-treesitter', {
	  run = ":TSUpdate"
  })
  use 'romgrk/nvim-treesitter-context' -- Shows the current function/class as float window (Not Working)
  -- The VIM must haves
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  -- Colorschemes
  use 'gruvbox-community/gruvbox'
  use 'Mofiqul/dracula.nvim'
  use 'navarasu/onedark.nvim'
  -- Statuslines
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- File Navigation
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  } 
  -- Language Server Protocol
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim' -- Auto LSP Installs
  -- TODO
  -- autopairs
  -- TMUX
  -- DAP (Debug Adapter Protocol)



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
