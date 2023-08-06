if vim.fn.has("linux") == 1 or vim.fn.has("wsl") == 1 then
  return {
    {

      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          'bash-language-server', 'r-languageserver', 'clangd', 'gopls', 'pyright', 'jdtls',
          "autopep8",
        },
      }
    } }
else
  return {}
end
