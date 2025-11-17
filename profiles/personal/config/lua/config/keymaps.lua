local map = vim.keymap.set

-- Normal mode mappings
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save buffer" })
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit" })
