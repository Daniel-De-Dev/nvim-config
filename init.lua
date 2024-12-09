-- Initialize the plugin manager (vim-plug)
vim.cmd([[
call plug#begin('~/.config/nvim/plugged')
]])

-- Core plugins
vim.cmd([[
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
]])

vim.cmd([[call plug#end()]])

-- Enable Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "vim", "lua", "markdown", "markdown_inline", "python", "bash", "cpp", "make", "rust"},
    sync_install = false,
    ignore_install = {},
    auto_install = false,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    modules = {},
}

-- GENERAL SETTING --
vim.o.mouse = ""
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

vim.wo.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.linebreak = true

vim.o.scrolloff = 4
vim.o.sidescrolloff = 8

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.hlsearch = false
vim.o.showmode = false

vim.o.termguicolors = true

vim.o.swapfile = false
vim.o.smartcase = true
vim.o.smartindent = true

vim.o.pumheight = 10
vim.o.conceallevel = 0

vim.wo.signcolumn = 'yes'
vim.o.fileencoding = 'utf-8'
vim.o.breakindent = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.writebackup = false
vim.o.undofile = true

vim.o.completeopt = 'menuone,noselect'

--------------------------

-- Customize color
vim.api.nvim_set_hl(0, "@variable", { fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#D2A6FF" })
vim.api.nvim_set_hl(0, "@type", { fg = "#59C3FE" })
vim.api.nvim_set_hl(0, "@function", { fg = "#FFB454" })
vim.api.nvim_set_hl(0, "@string", { fg = "#AAD94C" })
vim.api.nvim_set_hl(0, "@keyword.directive", { fg = "#FF8F40" })
vim.api.nvim_set_hl(0, "@keyword", { fg = "#FF8F40" })
vim.api.nvim_set_hl(0, "@constant", { fg = "#F8B053" })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#F8B053" })
vim.api.nvim_set_hl(0, "@number", { fg = "#D2A6FF" })
vim.api.nvim_set_hl(0, "@boolean", { fg = "#D2A6FF" })
vim.api.nvim_set_hl(0, "@operator", { fg = "#F29668" })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#59C3FE" })
vim.api.nvim_set_hl(0, "@property", { fg = "#FFFFFF" })

-- Enable inline hints
vim.lsp.inlay_hint.enable(true)

-- Create an autocommand for Lua files to set up the Lua language server
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'lua',
    callback = function(_)
        -- Configure the Lua language server with runtime and workspace settings
        vim.lsp.start({
            name = 'lua-language-server',
            cmd = {'lua-language-server'},
            root_dir = vim.fs.dirname(vim.fs.find({'.luarc.json', '.luarc.jsonc'}, { upward = true })[1]),
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT' -- Use LuaJIT for Neovim
                    },
                    workspace = {
                        library = {
                            vim.env.VIMRUNTIME,
                            vim.fn.stdpath('config') .. '/plugged/nvim-treesitter/lua',
                            vim.fn.stdpath('config') .. '/plugged/nvim-cmp/lua',
                            vim.fn.stdpath('config') .. '/plugged/cmp-buffer/lua',
                            vim.fn.stdpath('config') .. '/plugged/cmp-cmdline/lua',
                            vim.fn.stdpath('config') .. '/plugged/cmp-nvim-lsp/lua',
                            vim.fn.stdpath('config') .. '/plugged/nvim-path/lua',
                            vim.fn.stdpath('config') .. '/plugged/cmp-path/lua/',
                            vim.fn.stdpath('config') .. '/plugged/gitsigns.nvim/lua/',
                            vim.fn.stdpath('config') .. '/plugged/nvim-autopairs/lua/',
                        },
                    },
                    diagnostics = {
                        globals = {'vim'},
                        disable = {},
                        neededFilesStatus = {
                            ["codestyle-check"] = "Any", -- Enable codestyle checks
                            ["unused-local"] = "Any"     -- Check for unused local variables
                        },
                    },
                }
            }
        })
  end,
})

-- C/C++ Language Server setup for C/C++ files
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'c', 'cpp', 'h'},
    callback = function(_)
        vim.lsp.start({
            name = 'ccls',
            cmd = {'ccls'},
            root_dir = vim.fs.dirname(vim.fs.find({'.ccls', '.git'}, { upward = true })[1]),
            settings = {
                ccls = {
                    compilationDatabaseDirectory = "build",
                    index = {
                        threads = 2,
                    },
                    cache = {
                        directory = ".ccls-cache",
                    },
                    clang = {
                        extraArgs = {
                            "-I/usr/include",
                            "-Iinclude",
                            "-I/usr/local/include",
                            "-I/lib",
                        },
                        resourceDir = "/opt/clang+llvm/lib/clang/18/include"
                    },
                }
            }
        })
    end,
})

-- Create an autocommand for Python files to set up the Python language server
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function (_)
        vim.lsp.start({
            name = 'pyright',
            cmd = { 'pyright-langserver', '--stdio' },
            root_dir = vim.fs.dirname(vim.fs.find({ 'pyproject.toml', 'setup.py', 'setup.cfg', '.git' }, {upward = true})[1]),
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "strict",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "workspace",
                    },
                },
            },
        })
    end,
})

-- Rust language server setuo
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'rust',
    callback = function (_)
        -- Find the root directory of the project
        local root_dir = vim.fs.dirname(vim.fs.find({ 'cargo.toml', '.cargo', '.git', 'rust-project.json' }, { upward = true })[1])

        -- Check for a `.nvim.lua` file in the root directory
        local project_config = root_dir .. '/.nvim.lua'
        local settings = {}

        -- Load project-specific settings if the file exists
        if vim.fn.filereadable(project_config) == 1 then
            settings = dofile(project_config)
        end

        -- Start the Rust Analyzer with project-specific settings
        vim.lsp.start({
            name = 'Rust Analyzer',
            cmd = { 'rust-analyzer' },
            root_dir = root_dir,
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            settings = settings,
        })
    end,
})

require('nvim-autopairs').setup({
    check_ts = true,
    disable_filetype = {},
})

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup({
    -- Snippet = {}, -- If i ever choose to use one
    -- window = {},
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    }, {
        { name = 'path' }
    }),
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline();
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- Keymap for jumping to a defintion and decleration 
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })


-- Setup gitsigns
require('gitsigns').setup()
