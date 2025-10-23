{
  description = "Neovim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Formater
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      treefmt = import ./nix/treefmt {
        inherit inputs;
        inherit supportedSystems;
      };
    in
    treefmt
    // {
      homeManagerModules.default = { pkgs, ... }:
      {
        config = {

          home.packages = with pkgs; [
            ripgrep
            fd
            git

            lua-language-server
            nil
            nixpkgs-fmt
            stylua
          ];

          xdg.configFile."nvim" = {
            source = ./config;
            recursive = true;
          };
        };
      };
    };
}
