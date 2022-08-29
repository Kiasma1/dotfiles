-- Bootstrapping packer on any OS
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end


return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim" }
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {
	  'chriskempson/base16-vim',
	  config = function() 
		  	local ok, _ = pcall(vim.cmd, 'colorscheme base16-default-dark')
			if not ok then
			end
			base16colorspace = 256
			vim.cmd('source ~/.vimrc_background')
		end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
