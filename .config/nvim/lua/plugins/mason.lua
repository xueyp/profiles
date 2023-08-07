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
