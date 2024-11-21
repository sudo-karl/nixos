{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.catppuccin.homeManagerModules.catppuccin
    ../../modules/home-manager
  ];
  home.username = "karl";
  home.homeDirectory = "/home/karl";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # pkgs.hello
    hello
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono" "NerdFontsSymbolsOnly"];})
    firefox
    kitty
    neofetch
    statix
    black
    clang
    texpresso
    texliveBasic

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = ["JetBrainsMono Nerd Font"];
  };
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
  };

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
