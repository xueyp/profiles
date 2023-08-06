if vim.fn.has("win32") == 1 then
  return {
    { "lyokha/vim-xkbswitch" }
  }
else
  return {}
end
