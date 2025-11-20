return {
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
