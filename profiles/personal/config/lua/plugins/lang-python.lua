return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = 'strict',
              diagnosticMode = 'workspace',
              autoSearchPaths = true,
            },
          },
        },
      },
    },
  },
}
