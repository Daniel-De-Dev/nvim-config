return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      rust_analyzer = {
        -- NOTE: In ESP32 projects it fixed the error where it ends up using
        -- the rustup versions binary and wont start because of custom toolchain
        cmd = { "/etc/profiles/per-user/zeus/bin/rust-analyzer" },
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
