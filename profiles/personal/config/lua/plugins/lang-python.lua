return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      pylsp = {
        cmd = { 'uv', 'run', 'pylsp' },
      },
    },
  },
}
