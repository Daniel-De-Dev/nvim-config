return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      'folke/lazydev.nvim',
    },
    opts = {},
    ---@param opts table<string, any>
    config = function(_, opts)
      -- Global default capabilities for all LSPs
      local capabilities = require('blink.cmp').get_lsp_capabilities(nil, true)
      vim.lsp.config('*', { capabilities = capabilities })

      -- Universal behaviour when any lsp attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end
          map('n', 'gd', vim.lsp.buf.definition, 'LSP: Goto Definition')
          map('n', 'gr', vim.lsp.buf.references, 'LSP: Find References')
          map('n', 'gi', vim.lsp.buf.implementation, 'LSP: Goto Implementation')
          map('n', 'K', vim.lsp.buf.hover, 'LSP: Hover Documentation')
          map('n', '<leader>rn', vim.lsp.buf.rename, 'LSP: Rename Symbol')
          map('n', '<leader>ca', vim.lsp.buf.code_action, 'LSP: Code Actions')
          map(
            'n',
            '<leader>ld',
            vim.diagnostic.open_float,
            'LSP: Show Line Diagnostics'
          )

          if client:supports_method('textDocument/inlayHint', bufnr) then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

            map(
              'n',
              '<leader>th',
              function()
                vim.lsp.inlay_hint.enable(
                  not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                  { bufnr = bufnr }
                )
              end,
              'LSP: Toggle Inlay Hints'
            )
          end
        end,
      })

      for server_name, server_config in pairs(opts) do
        vim.lsp.config(server_name, server_config)
        vim.lsp.enable(server_name)
      end
    end,
  },
}
