-- Import Lua modules
require('packer_init')
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('plugins/alpha-nvim')
require('plugins/nvim-tree')
if vim.fn.has("linux") == 1 or vim.fn.has("wsl") == 1 then
  require('plugins/indent-blankline')
  require('core/colors')
  require('core/statusline')
  require('plugins/nvim-cmp')
  require('plugins/nvim-lspconfig')
  require('plugins/nvim-treesitter')
  require('plugins/nvim-dap-ui')
end
