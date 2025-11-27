return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      -- map: Parser -> FileType
      local map = {
        lua = 'lua',
        nix = 'nix',
      }

      local parsers_to_install = {}
      ---@type table<string, boolean>
      local supported_filetypes = {}

      for parser, ft in pairs(map) do
        table.insert(parsers_to_install, parser)
        if ft then supported_filetypes[ft] = true end
      end

      require('nvim-treesitter').install(parsers_to_install)

      vim.api.nvim_create_autocmd({ 'FileType', 'BufWinEnter' }, {
        group = group,
        pattern = '*',
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          if not supported_filetypes[ft] then return end

          if args.event == 'FileType' then
            local ok = pcall(vim.treesitter.start, args.buf)
            if not ok then return end
          end

          vim.bo[args.buf].indentexpr =
            'v:lua.require\'nvim-treesitter\'.indentexpr()'
          vim.wo.foldmethod = 'expr'
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end,
      })
    end,
  },
}
