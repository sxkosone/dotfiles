--  ____ ____ ____ ____ ____ ____ ____
-- ||p |||l |||u |||g |||i |||n |||s ||
-- ||__|||__|||__|||__|||__|||__|||__||
-- |/__\|/__\|/__\|/__\|/__\|/__\|/__\|

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- === colorscheme(s) ===
  use 'https://github.com/folke/tokyonight.nvim'
  use 'https://github.com/navarasu/onedark.nvim'

  -- === completion ===
  use 'https://github.com/neovim/nvim-lspconfig'
  use 'https://github.com/hrsh7th/nvim-compe'
  -- TODO fix lspsage, commands error
  -- use 'https://github.com/glepnir/lspsaga.nvim'
  -- specify prior telescope version to use because newest version requires neovim 9.0
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'https://github.com/kabouzeid/nvim-lspinstall'
  use 'https://github.com/nvim-lua/popup.nvim'
  use 'https://github.com/nvim-lua/plenary.nvim'
  use 'https://github.com/folke/lsp-trouble.nvim'

  -- === experiments ===
  use {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup {}
    end
  }
  use 'https://github.com/Vimjas/vim-python-pep8-indent'
  use 'https://github.com/tpope/vim-dadbod'
  use 'https://github.com/kristijanhusak/vim-dadbod-ui'

  -- === find ===
  use { 'https://github.com/junegunn/fzf', run='./install --bin' }
  use 'https://github.com/junegunn/fzf.vim'

  -- === git ===
  use 'https://github.com/junegunn/gv.vim'
  use 'https://github.com/mhinz/vim-signify'

  -- === language plugins ===
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'https://github.com/hail2u/vim-css3-syntax', ft = {'css', 'scss'} }
  use {
    'https://github.com/iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
    ft = {'markdown'}
  }
  use {
    'https://github.com/maxmellon/vim-jsx-pretty',
    ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
  }
  use {
    'https://github.com/HerringtonDarkholme/yats.vim',
    ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
  }
  use { 'https://github.com/othree/html5.vim', ft = {'html'} }
  use {
    'https://github.com/yuezk/vim-js',
    ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
  }
  use { 'https://github.com/rust-lang/rust.vim', ft = {'rust'} }
  use { 'https://github.com/vim-python/python-syntax', ft = {'python'} }

  -- === other ===
  use 'https://github.com/stefandtw/quickfix-reflector.vim'
  use 'https://github.com/norcalli/nvim-colorizer.lua'
  use 'https://github.com/terrortylor/nvim-comment'
  use 'https://github.com/tweekmonster/startuptime.vim'
  use 'https://github.com/RRethy/vim-illuminate'
  use 'https://github.com/janko-m/vim-test'
  use 'https://github.com/romainl/vim-cool'
  use 'https://github.com/tpope/vim-fugitive'
  use 'https://github.com/tpope/vim-rails'
  use 'https://github.com/tpope/vim-rhubarb'
  use 'https://github.com/tpope/vim-rsi'
  use {
    'https://github.com/glepnir/galaxyline.nvim', branch = 'main',
    requires = {'https://github.com/kyazdani42/nvim-web-devicons'}
  }
  use 'https://github.com/windwp/nvim-autopairs'
  use {
    'https://github.com/windwp/nvim-ts-autotag',
    ft = {'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
