{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 12;
    shellIntegration.enableZshIntegration = true;
    settings = {
      enable_audio_bell = false;
      background_opacity = 0.5;
      background_blur = 20;
    };
  };
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      ls = "ls -a";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos#default";
    };
    syntaxHighlighting.enable = true;
    history.save = 200;
    history.size = 200;
  };
  programs.starship = {
    enable = true;
    settings = {add_newline = true;};
    enableZshIntegration = true;
  };
  programs.btop.enable = true;
  programs.tmux = {
    enable = true;
    disableConfirmationPrompt = true;
    clock24 = true;
    mouse = true;
    shell = "/${pkgs.zsh}/bin/zsh";
    shortcut = "Space";
    baseIndex = 1;
    keyMode = "vi";
    plugins = with pkgs; [tmuxPlugins.vim-tmux-navigator];
    escapeTime = 0;
    extraConfig = "set -g status-position top";
  };
  programs.git = {
    enable = true;
    userEmail = "186639318+sudo-karl@users.noreply.github.com";
    userName = "sudo-karl";
  };
  programs.bat.enable = true;
  programs.cava = {
    enable = false;
    settings = {
      general.framerate = 60;
    };
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
  };
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };
}
