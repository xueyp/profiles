if vim.fn.has("win32") == 1 then
  return {
    { "lyokha/vim-xkbswitch" }, 
    
      -- disabled plugins
  { "akinsho/bufferline.nvim", enabled = false },
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },
  { "neovim/nvim-lspconfig", enabled = false },
  { "folke/neoconf.nvim", enabled = false },          
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "jose-elias-alvarez/null-ls.nvim", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
  { "mfussenegger/nvim-dap", enabled = false },
  { "rcarriga/nvim-dap-ui", enabled = false },
  { "theHamsta/nvim-dap-virtual-text", enabled = false },
  { "jay-babu/mason-nvim-dap", enabled = false },
  { "jbyuki/one-small-step-for-vimkind", enabled = false },
  { "nvim-treesitter/nvim-treesitter", enabled = false },
  { "RRethy/vim-illuminate", enabled = false },
  } --end return
else
  return {}
end