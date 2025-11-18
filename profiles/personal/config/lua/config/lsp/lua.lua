local M = {}

-- Lua is exclusively used for nvim, hence tailored for it as of now
function M.setup()
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
					groupFileStatus = {
						strict = "Any",
						strong = "Any",
						["type-check"] = "Any",
					},
					groupSeverity = {
						strict = "Error",
						strong = "Warning",
						["type-check"] = "Error",
					},
				},
				completion = {
					callSnippet = "Replace",
				},
				workspace = {
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
				type = {
					weakNilCheck = false,
				},
				hint = {
					enable = true,
					setType = true,
					paramType = true,
					paramName = "All",
					arrayIndex = "Auto",
					await = true,
					awaitPropagate = true,
				},
			},
		},
	})

	vim.lsp.enable("lua_ls")
end

return M
