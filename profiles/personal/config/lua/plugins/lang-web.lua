return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      html = {},
      ts_ls = {},
      astro = {},
      css_variables = {
        -- NOTE: Has to installed with `npm i -D css-variables-language-server`
        cmd = { 'node_modules/.bin/css-variables-language-server', '--stdio' },
        filetypes = { 'css', 'scss', 'less', 'html', 'astro' },
      },
    },
  },
}
