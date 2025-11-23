{ pkgs }:
{
  deps = with pkgs; [
    lua-language-server
    ripgrep
    fd
    gcc
    gnumake
    tree-sitter
  ];
}
