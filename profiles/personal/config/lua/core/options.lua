local opt = vim.opt -- for convenience

-- ## General
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- ## UI
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative numbers
opt.termguicolors = true  -- Enable true color support
opt.scrolloff = 8         -- Keep 8 lines of context around cursor
opt.signcolumn = "yes"    -- Always show the signcolumn

-- ## Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true      -- Use spaces instead of tabs
opt.autoindent = true
opt.smartindent = true

-- ## Search
opt.incsearch = true     -- Incremental search
opt.ignorecase = true    -- Ignore case in search
opt.smartcase = true     -- ...unless it contains uppercase
opt.hlsearch = false     -- Don't highlight search results permanently

-- ## Other
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.undofile = true
