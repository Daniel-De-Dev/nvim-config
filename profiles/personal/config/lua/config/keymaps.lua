local map = vim.keymap.set

-- Normal mode mappings
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Buffer: Save (Write)" })
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Buffer: Close (Delete)" })
map("n", "<leader>qq", "<cmd>q<CR>", { desc = "Editor: Quit Neovim" })
