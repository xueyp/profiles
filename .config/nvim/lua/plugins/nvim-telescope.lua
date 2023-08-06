if vim.fn.has("linux") == 1 or vim.fn.has("wsl") == 1 then
  return { {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
  }
else return {}
end
