return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = 'strict',
              diagnosticMode = 'workspace',
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
    },
  },
}
