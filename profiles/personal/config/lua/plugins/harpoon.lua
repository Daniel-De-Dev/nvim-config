return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require("harpoon")

    return {
      {
        "<leader>a",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon: Add File (Mark)",
      },
      {
        "<C-e>",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon: Toggle Menu (List/UI)",
      },
      {
        "<leader>1",
        function()
          harpoon:list():select(1)
        end,
        desc = "Harpoon: Go to File 1 (Jump)",
      },
      {
        "<leader>2",
        function()
          harpoon:list():select(2)
        end,
        desc = "Harpoon: Go to File 2 (Jump)",
      },
      {
        "<leader>3",
        function()
          harpoon:list():select(3)
        end,
        desc = "Harpoon: Go to File 3 (Jump)",
      },
      {
        "<leader>4",
        function()
          harpoon:list():select(4)
        end,
        desc = "Harpoon: Go to File 4 (Jump)",
      },
      {
        "<leader>hn",
        function()
          harpoon:list():next()
        end,
        desc = "Harpoon: Next File (Cycle)",
      },
      {
        "<leader>hp",
        function()
          harpoon:list():prev()
        end,
        desc = "Harpoon: Previous File (Cycle)",
      },
    }
  end,
}
