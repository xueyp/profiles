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

  --if vim.fn.has("linux") == 1 or vim.fn.has("wsl") == 1 then

  -- asyncbuild
  { "skywind3000/asyncrun.vim" },
  -- neoformat
  --{ "sbdchd/neoformat" },
  -- Color schemes
  { 'navarasu/onedark.nvim' },
  { 'tanvirtin/monokai.nvim' },
  { 'rose-pine/neovim',        name = 'rose-pine' },

  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  --end--  end of if vim.fn.has("linux")

  -- xkb-switch
  --if vim.fn.has("win32") == 1 then { "lyokha/vim-xkbswitch" },
  --end
}
