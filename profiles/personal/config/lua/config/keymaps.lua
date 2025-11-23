local map = vim.keymap.set

-- Normal mode mappings
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Buffer: Save (Write)" })
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Buffer: Close (Delete)" })
map("n", "<leader>qq", "<cmd>q<CR>", { desc = "Editor: Quit Neovim" })

-- Remap switching between windows
map("n", "<C-h>", "<C-w>h", { desc = "Window: Focus Left (Split)" })
map("n", "<C-j>", "<C-w>j", { desc = "Window: Focus Down (Split)" })
map("n", "<C-k>", "<C-w>k", { desc = "Window: Focus Up (Split)" })
map("n", "<C-l>", "<C-w>l", { desc = "Window: Focus Right (Split)" })

-- Disable arrow keys in normal, visual, and insert modes
local modes = { "n", "v", "i" }
for _, m in ipairs(modes) do
  map(m, "<Up>", "<Nop>", { silent = true, desc = "Editor: Disable Up Arrow (Hard Mode)" })
  map(m, "<Down>", "<Nop>", { silent = true, desc = "Editor: Disable Down Arrow (Hard Mode)" })
  map(m, "<Left>", "<Nop>", { silent = true, desc = "Editor: Disable Left Arrow (Hard Mode)" })
  map(m, "<Right>", "<Nop>", { silent = true, desc = "Editor: Disable Right Arrow (Hard Mode)" })
end
