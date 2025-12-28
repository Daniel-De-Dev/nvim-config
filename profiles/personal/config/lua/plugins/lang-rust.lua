return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            check = {
              command = 'clippy',
            },
            diagnostics = {
              enable = true,
            },
          },
        },
      },
    },
  },
}
