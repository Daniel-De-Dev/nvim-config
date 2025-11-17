{ ... }:
{
  projectRootFile = "flake.nix";

  settings.global.excludes = [
  ];

  # Nix
  programs.nixfmt = {
    enable = true;
    includes = [
      "*.nix"
    ];
  };

  # Markdown
  programs.mdformat = {
    enable = true;
    includes = [ "*.md" ];

    settings = {
      wrap = 80;
    };
  };

  # Lua
  programs.stylua = {
    enable = true;
    includes = [ "*.lua" ];
  };
}
