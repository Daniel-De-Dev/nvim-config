return {
  {
    'darkvoid-theme/darkvoid.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        string = '#599999',
        bool = '#71c5c5',
      },
    },
    config = function(_, opts)
      require('darkvoid').setup(opts)
      vim.cmd.colorscheme('darkvoid')
    end,
  },
}
