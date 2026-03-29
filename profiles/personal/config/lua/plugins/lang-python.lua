return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      -- Default fallback: Pyright (via Nix)
      pyright = {
        on_new_config = function(config, root_dir)
          local venv_python = root_dir .. '/.venv/bin/python'
          if vim.fn.executable(venv_python) == 1 then
            if not config.settings.python then config.settings.python = {} end
            config.settings.python.pythonPath = venv_python
          end
        end,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = 'strict',
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'workspace',
            },
          },
        },
      },

      -- Context-Aware: pylsp
      pylsp = {
        -- Dynamically check before the LSP boots up
        on_new_config = function(config, root_dir)
          local uv_lock = root_dir .. '/uv.lock'

          if vim.fn.filereadable(uv_lock) == 1 then
            config.cmd = { 'uv', 'run', 'pylsp' }
          else
            config.cmd = { 'pylsp' }
          end
        end,

        root_dir = function(fname)
          local util = require('lspconfig.util')
          return util.root_pattern('uv.lock', 'pyproject.toml', '.git')(fname)
        end,
      },
    },
  },
}
