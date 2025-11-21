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
              disable = { "spell-check" },
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
                ["name-style-check"] = "Information",
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
