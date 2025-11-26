return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    keys = {
      {
        '-',
        '<CMD>Oil<CR>',
        desc = 'Oil: Open Parent Directory (File Explorer)',
      },
    },
    opts = {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = true,

      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
      },

      constrain_cursor = 'name',

      lsp_file_methods = {
        autosave_changes = true,
      },

      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['<M-h>'] = {
          'actions.select_split',
          desc = 'Oil: Open Split (Horizontal)',
        },
        ['<C-r>'] = { 'actions.refresh', desc = 'Oil: Refresh View (Reload)' },
        ['q'] = { 'actions.close', desc = 'Oil: Close Window (Quit)' },
        ['yp'] = {
          callback = function()
            local oil = require('oil')
            local entry = oil.get_cursor_entry()
            if entry then
              local path = oil.get_current_dir() .. entry.name
              vim.fn.setreg('+', path)
              vim.notify('Path copied to clipboard')
            end
          end,
          desc = 'Oil: Copy Path (System Clipboard)',
        },
        ['<leader>ff'] = {
          callback = function()
            require('telescope.builtin').find_files({
              cwd = require('oil').get_current_dir(),
              hidden = true,
            })
          end,
          desc = 'Oil: Find Files (Current Directory)',
        },
        ['<leader>t'] = {
          callback = function()
            local dir = require('oil').get_current_dir()
            if dir then
              vim.cmd('split')
              vim.cmd('lcd ' .. vim.fn.fnameescape(dir))
              vim.cmd('terminal ' .. (os.getenv('SHELL') or '/bin/sh'))
            end
          end,
          desc = 'Oil: Open Terminal (Shell)',
        },
      },

      columns = {
        'icon',
        'size',
      },
    },
  },
}
