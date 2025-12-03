{ pkgs }:
{
  deps = with pkgs; [
    lua-language-server
    nixd
    ripgrep
    fd
    gcc
    gnumake
    tree-sitter
    bash-language-server
    shellcheck
    marksman
  ];
}
