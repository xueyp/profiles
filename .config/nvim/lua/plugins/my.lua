return {
  --{
  -- Icons
  --  'kyazdani42/nvim-web-devicons',
  --},
  {
    -- Tag viewer
    "preservim/tagbar",
  },
  {
    --markdown_preview
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      if vim.fn.has("wsl") == 1 or vim.fn.has("linux") == 1 then
        vim.cmd([[do FileType]])
        vim.cmd([[
           function OpenMarkdownPreview (url)
              let cmd = "google-chrome-stable --new-window " . shellescape(a:url) . " &"
              silent call system(cmd)
          endfunction
        ]])
        vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
      end
    end,
  },
  -- Color schemes
  --{ 'navarasu/onedark.nvim' },
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({})
    end,
  },
}
