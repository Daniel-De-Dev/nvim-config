return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      pyright = {
        analysis = {
          typeCheckingMode = 'strict',
          diagnosticMode = 'workspace',
        },
      },
    },
  },
}
