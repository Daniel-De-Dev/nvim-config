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
        map("n", "<leader>gj", function()
          gs.nav_hunk("next")
        end, "Git: Next Hunk (Jump)")

        map("n", "<leader>gk", function()
          gs.nav_hunk("prev")
        end, "Git: Previous Hunk (Jump)")

        map("n", "<leader>gK", function()
          vim.cmd.normal({ "gg0", bang = true })
          gs.nav_hunk("next")
        end, "Git: First Hunk (Top)")

        map("n", "<leader>gJ", function()
          vim.cmd.normal({ "G$", bang = true })
          gs.nav_hunk("prev")
        end, "Git: Last Hunk (Bottom)")

        -- Hunk actions
        map({ "n", "v" }, "<leader>gs", gs.stage_hunk, "Git: Stage Hunk")
        map("n", "<leader>gS", gs.stage_buffer, "Git: Stage Buffer (All)")

        map({ "n", "v" }, "<leader>gr", gs.reset_hunk, "Git: Reset Hunk (Undo)")
        map("n", "<leader>gR", gs.reset_buffer, "Git: Reset Buffer (Undo All)")

        map("n", "<leader>gp", gs.preview_hunk, "Git: Preview Hunk")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Git: Undo Stage Hunk")

        -- Blame & diff
        map("n", "<leader>gb", gs.toggle_current_line_blame, "Git: Toggle Line Blame")
        map("n", "<leader>gd", gs.diffthis, "Git: Diff against Index")
        map("n", "<leader>gD", function()
          gs.diffthis("~")
        end, "Git: Diff against Last Commit (HEAD~1)")
      end,
    },
  },
}
