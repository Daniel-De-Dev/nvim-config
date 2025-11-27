return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      nixd = {
        settings = {
          nixd = {
            nixpkgs = {
              expr = 'import <nixpkgs> { }',
            },
            formatting = {
              command = { 'nixfmt' },
            },
            options = {
              nixos = {
                -- Assume the env variable is set.
                expr = string.format(
                  '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations."%s".options',
                  os.getenv('NIXOS_HOSTNAME')
                ),
              },
            },
          },
        },
      },
    },
  },
}
