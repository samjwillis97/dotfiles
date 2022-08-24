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
  }) -- What ?
  use 'nvim-treesitter/playground' -- What?
  use 'romgrk/nvim-treesitter-context' -- What?
  -- The VIM must haves
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  -- Colorschemes
  use 'gruvbox-community/gruvbox'
  use 'Mofiqul/dracula.nvim'
  use 'navarasu/onedark.nvim'
  -- Language Server Protocol
  use {'neoclide/coc.nvim', branch = 'release'}
  -- TODO
  -- coc
  -- nerdtree/git
  -- autopairs
  -- git gutter
  -- vim airline
  -- DAP (Debug Adapter Protocol)



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
