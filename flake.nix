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
    inputs@{ nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forEachSystem = nixpkgs.lib.genAttrs supportedSystems;
      treefmt = import ./nix/treefmt {
        inherit inputs;
        inherit supportedSystems;
      };
    in
    treefmt
    // {
      packages = forEachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          # What programs need to available for nvim
          nvimDeps = with pkgs; [
          ];

          nvimConfigDir = pkgs.stdenv.mkDerivation {
            name = "nvim-config-dir";
            src = ./config;
            dontUnpack = true;

            installPhase = ''
              mkdir -p $out/nvim
              cp -r $src/* $out/nvim/
            '';
          };

        in
        {
          default = pkgs.writeShellScriptBin "nvim" ''
            export XDG_CONFIG_HOME=${nvimConfigDir}
            export PATH=${pkgs.lib.makeBinPath nvimDeps}:$PATH
            exec ${pkgs.neovim}/bin/nvim "$@"
          '';
        }
      );
    };
}
