return {
  {
    -- Autopair
    'windwp/nvim-autopairs',
  },
  --{
  -- Icons
  --  'kyazdani42/nvim-web-devicons',
  --},
  {
    -- Tag viewer
    'preservim/tagbar',
  },
  {
    --markdown_preview
    --install without yarn or npm
    "iamcco/markdown-preview.nvim",
    build = "call mkdp#util#install() ",
  },
  -- Color schemes
  { 'navarasu/onedark.nvim' },
  { 'tanvirtin/monokai.nvim' },
  { 'rose-pine/neovim',      name = 'rose-pine' },
  {
    "folke/noice.nvim",
    -- add any options here
    --opts = {
    --  cmdline = {
    --    view = "cmdline",
    --  },
    --},
  },

}
