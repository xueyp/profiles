if vim.fn.has("linux") == 1 or vim.fn.has("wsl") == 1 then
return {
  {
    "mfussenegger/nvim-dap",

  }, }
else return {}
end
