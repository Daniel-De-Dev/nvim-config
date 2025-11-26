return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    opts = {
      defaults = {
        sorting_strategy = 'ascending',
        layout_strategy = 'flex',
        layout_config = {
          prompt_position = 'top',
          width = 0.9,
          height = 0.85,
        },
        dynamic_preview_title = true,
        path_display = { 'smart' },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-Down>'] = 'cycle_history_next',
            ['<C-Up>'] = 'cycle_history_prev',
          },
        },
        preview = {
          treesitter = true,
        },
        file_ignore_patterns = { '%.git/' },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          theme = 'dropdown',
          previewer = false,
          sort_mru = true,
          ignore_current_buffer = true,
          mappings = {
            i = { ['<c-d>'] = 'delete_buffer' },
          },
        },
        current_buffer_fuzzy_find = {
          previewer = false,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    },
    config = function(_, opts)
      local telescope = require('telescope')

      opts.extensions['ui-select'] = {
        require('telescope.themes').get_ivy(),
      }

      telescope.setup(opts)
      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')
    end,
    cmd = 'Telescope',
    keys = {
      {
        '<leader>ff',
        '<cmd>Telescope find_files<cr>',
        desc = 'Telescope: Find Files (Root)',
      },
      {
        '<leader>fb',
        '<cmd>Telescope buffers<cr>',
        desc = 'Telescope: Open Buffers',
      },
      {
        '<leader>fh',
        '<cmd>Telescope help_tags<cr>',
        desc = 'Telescope: Help Tags',
      },
      {
        '<leader>/',
        '<cmd>Telescope current_buffer_fuzzy_find<cr>',
        desc = 'Telescope: Fuzzy Find in Buffer',
      },
      {
        '<leader>sn',
        function()
          require('telescope.builtin').find_files({
            cwd = vim.fn.stdpath('config'),
            hidden = true,
          })
        end,
        desc = 'Telescope: Search Neovim Config (Dotfiles)',
      },
      {
        '<leader>fg',
        function()
          require('telescope.builtin').live_grep({
            additional_args = function(_)
              return { '--hidden', '--glob', '!.git/*' }
            end,
          })
        end,
        desc = 'Telescope: Live Grep (Project Search)',
      },
      {
        '<leader>sk',
        '<cmd>Telescope keymaps<cr>',
        desc = 'Telescope: Keymaps',
      },
      {
        '<leader>sd',
        '<cmd>Telescope lsp_document_symbols<cr>',
        desc = 'Telescope: Document Symbols (LSP)',
      },
      {
        '<leader>sw',
        '<cmd>Telescope lsp_workspace_symbols<cr>',
        desc = 'Telescope: Workspace Symbols (LSP)',
      },
    },
  },
}
