return {
  {
    "Daniel-De-Dev/blink.cmp",
    build = "nix run --accept-flake-config .#build-plugin",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      completion = {
        keyword = {
          range = "full",
        },

        documentation = {
          auto_show = true,
        },

        ghost_text = {
          enabled = true,
          show_without_selection = true,
        },

        list = {
          selection = {
            preselect = false,
          },
        },
      },

      keymap = {
        preset = "enter",
      },

      signature = {
        enabled = true,
      },

      cmdline = {
        completion = {
          menu = {
            auto_show = true,
          },
        },
      },

      fuzzy = {
        sorts = {
          "exact",
          "score",
          "sort_text",
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
    },
  },
}
