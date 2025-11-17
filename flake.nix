{
  description = "Neovim Configuration Profiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forEachSystem = nixpkgs.lib.genAttrs supportedSystems;
      treefmt = import ./nix/treefmt {
        inherit inputs;
        inherit supportedSystems;
      };

      mkConfigProfile =
        {
          pkgs,
          profileName,
          profilePath,
        }:
        let
          profileMeta = import profilePath { inherit pkgs; };
        in
        profileMeta
        // {
          # Build the config directory from ./profiles/<name>/config
          dir = pkgs.stdenv.mkDerivation {
            name = "nvim-config-${profileName}";
            src = profilePath + "/config";

            installPhase = ''
              mkdir -p $out/nvim
              cp -r $src/* $out/nvim/
            '';
          };
        };
    in
    treefmt
    // {
      configs = forEachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          personal = mkConfigProfile {
            inherit pkgs;
            profileName = "personal";
            profilePath = ./profiles/personal;
          };
        }
      );
    };
}
