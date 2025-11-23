return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true
    },
  },
  keys = function()
    return {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon: Add File (Mark)",
      },
      {
        "<C-e>",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Harpoon: Toggle Menu (List/UI)",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon: Go to File 1 (Jump)",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon: Go to File 2 (Jump)",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon: Go to File 3 (Jump)",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon: Go to File 4 (Jump)",
      },
      {
        "<leader>hn",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon: Next File (Cycle)",
      },
      {
        "<leader>hp",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon: Previous File (Cycle)",
      },
    }
  end,
}
