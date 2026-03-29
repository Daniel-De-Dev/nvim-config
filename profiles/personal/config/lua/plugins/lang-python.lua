return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      pyright = {
        root_markers = { 'uv.lock', 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
        settings = {
          python = {
            pythonPath = '.venv/bin/python',
            analysis = {
              typeCheckingMode = 'strict',
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'workspace',
            },
          },
        },
      },
    },
  },
}
