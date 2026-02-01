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
    rust-analyzer
    vscode-langservers-extracted
    typescript-language-server
    astro-language-server
  ];
}
