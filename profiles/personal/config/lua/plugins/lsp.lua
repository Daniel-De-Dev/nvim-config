return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			require("config.lsp").setup()
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		dependencies = {
			"neovim/nvim-lspconfig", -- relies on it to setup lua_ls
		},
		opts = {
			library = {},
		},
	},
}
