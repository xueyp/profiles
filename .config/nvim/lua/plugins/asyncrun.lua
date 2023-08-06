if vim.fn.has("linux") == 1 or vim.fn.has("wsl") == 1 then
  return{
      -- asyncbuild
  { "skywind3000/asyncrun.vim" },
  }
else return {}
end
