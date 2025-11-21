return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {

      numhl = true,
      attach_to_untracked = true,

      -- Appends to the defaults
      preview_config = {
        border = "rounded",
      },

      -- Set keymaps only when attached
      on_attach = function(bufnr)
        ---@type table<string, function>
        local gs = package.loaded.gitsigns

        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Hunk navigation
        map("n", "<leader>hj", function()
          gs.nav_hunk("next")
        end, "Next git hunk")

        map("n", "<leader>hk", function()
          gs.nav_hunk("prev")
        end, "Prev git hunk")

        map("n", "<leader>hK", function()
          vim.cmd.normal({ "gg0", bang = true })
          gs.nav_hunk("next")
        end, "First git hunk")

        map("n", "<leader>hJ", function()
          vim.cmd.normal({ "G$", bang = true })
          gs.nav_hunk("prev")
        end, "Last git hunk")

        -- Hunk actions
        map({ "n", "v" }, "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")

        map({ "n", "v" }, "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

        -- Blame & diff
        map("n", "<leader>hb", gs.toggle_current_line_blame, "Toggle line blame")
        map("n", "<leader>hd", gs.diffthis, "Diff against index")
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Diff against last commit")
      end,
    },
  },
}
