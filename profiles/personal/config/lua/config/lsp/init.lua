local M = {}

-- Global default capabilities for all LSPs
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

-- Universal behaviour when any lsp attaches
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end

		map("n", "gd", vim.lsp.buf.definition, "Goto definition")
		map("n", "gr", vim.lsp.buf.references, "Goto references")
		map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
		map("n", "K", vim.lsp.buf.hover, "Hover documentation")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
		map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>ld", vim.diagnostic.open_float, "Line diagnostics")

		if client:supports_method("textDocument/inlayHint") then
			pcall(vim.lsp.inlay_hint.enable, bufnr, true)
		end
	end,
})

-- Per-language configs
function M.setup()
	require("config.lsp.lua").setup()
end

return M
