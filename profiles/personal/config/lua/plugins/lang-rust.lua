return {
  {
    'neovim/nvim-lspconfig',
    init = function()
      -- Disable enforcement of 4-space indent
      vim.g.rust_recommended_style = 0
    end,
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
