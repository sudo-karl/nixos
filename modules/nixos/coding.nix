{
  pkgs,
  config,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    clang-tools
    nixd
    gcc
    alejandra
    statix
    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        matplotlib
        numpy
        manim
        black
        pylint
      ]))
    stylua
    lua5_1
    lua51Packages.lua-lsp
    cmake
    gnumake
    cmake-language-server
    pyright
    marksman
    ltex-ls
    arduino-language-server
    bash-language-server
    shellcheck
    shellharden
    shfmt
    isort
  ];
}
