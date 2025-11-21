return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              disable = { "spell-check", "name-style-check" },
              globals = { "vim" },
              groupFileStatus = {
                strong = "Opened",
                await = "Opened",
                codestyle = "Opened",
                luadoc = "Opened",
              },
              neededFileStatus = {
                ["global-elements"] = "Opened",
              },
              groupSeverity = {
                ["type-check"] = "Error",
                ambiguity = "Error",
                global = "Error",
                unbalanced = "Error",
                strong = "Error",
                await = "Error",
                unused = "Warning",
                redefined = "Warning",
                codestyle = "Hint",
                luadoc = "Information",
              },
              severity = {
                ["lowercase-global"] = "Warning",
              },
            },
            completion = {
              callSnippet = "Replace",
            },
            workspace = {
              checkThirdParty = false,
            },
            type = {
              castNumberToInteger = true,
              inferParamType = true,
            },
            hint = {
              enable = true,
              setType = true,
              awaitPropagate = true,
            },
            format = {
              enable = false,
              defaultConfig = {
                indent_size = "2",
              },
            },
          },
        },
      },
    },
  },
}
