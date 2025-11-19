local opt = vim.opt

-- General
opt.mouse = "" -- Disable mouse support

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- UI & Appearance
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"
opt.termguicolors = true
opt.showmode = false
opt.cursorline = true
opt.cursorlineopt = "number"
opt.laststatus = 3

opt.colorcolumn = "80"
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.conceallevel = 0
opt.pumheight = 10
opt.fillchars = { eob = " " }

-- TEXT, INDENTATION & WRAPPING
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.wrap = false -- no wrapping by default
opt.breakindent = true -- better indent when wrapping is on
opt.linebreak = true -- wrap on word boundaries
opt.showbreak = "↪ "

-- SEARCH
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.inccommand = "nosplit"

-- SCROLLING
opt.scrolloff = 8
opt.sidescrolloff = 8

-- WINDOWS & SPLITS
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- FILES & BACKUPS
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true

-- PERFORMANCE & BEHAVIOR
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = { "menu", "menuone", "noselect" }

opt.hidden = true
opt.confirm = true
opt.shortmess:append({ W = true, I = true, c = true })
opt.iskeyword:append("-") -- treat dash-separated words as a word

-- GLOBAL DIFF BEHAVIOUR
opt.diffopt = {
	"algorithm:histogram",
	"closeoff",
	"filler",
	"indent-heuristic",
	"internal",
	"hiddenoff",
	"linematch:80",
}
