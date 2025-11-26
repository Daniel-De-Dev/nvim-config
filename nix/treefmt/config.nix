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
    settings = {
      indent_type = "Spaces";
      indent_width = 2;
      quote_style = "ForceSingle";
      collapse_simple_statement = "Always";
      column_width = 80;
    };
  };
}
