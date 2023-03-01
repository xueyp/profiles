-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup({
config = {
    max_jobs = 16,
    git = {
	    --default_url_format = 'git@github.com:%s'
	    --default_url_format = 'https://hub.nuaa.cf/%s'
      default_url_format = 'https://github.com/%s'
	    --default_url_format = 'https://ghproxy.com/https://github.com/%s'
      --default_url_format = "https://hub.fastgit.xyz/%s",
      --default_url_format = "https://gitcode.net/mirrors/%s",
      --default_url_format = "https://gitclone.com/github.com/%s",
    },
  },
function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Tag viewer
  use 'preservim/tagbar'

 --markdown_preview
 --install without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

 -- Statusline
  use {
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  -- auto-session
  use {
  'rmagatti/auto-session',
  }


 if vim.fn.has("Linux") == 1 or vim.fn.has("wsl") then
  -- Treesitter interface
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- nvmi-dap-ui
  use {'theHamsta/nvim-dap-virtual-text'}
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { "mfussenegger/nvim-dap" }

  -- mason
  use { "williamboman/mason.nvim" }
  -- asyncrun
  use { "skywind3000/asyncrun.vim" }
  -- neoformat
  use { "sbdchd/neoformat" }
  -- Color schemes
  use 'navarasu/onedark.nvim'
  use 'tanvirtin/monokai.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup{}
    end
  }
  -- telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
}

end--  end of if vim.fn.has("Linux")



  -- xkb-switch
  if vim.fn.has("win32") == 1 then use { "lyokha/vim-xkbswitch" }
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end
})

