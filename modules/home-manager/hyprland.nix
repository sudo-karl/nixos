{ pkgs, inputs, config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, b, exec, firefox"
        "$mod, return, exec, kitty"
        "$mod, space, exec, rofi -show drun"
        "$mod, e, exec, thunar"
        "$mod, q, killactive"
        "$mod, m, exit"
        "$SUPER_SHIFT, l, exec, hyprlock"
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
        "$mod, g, togglesplit,"
        "$mod, f, fullscreen,"
        "$mod, v, togglefloating,"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];
      monitor = "HDMI-A-1, 1920x1080@144, 0x0, 1";
      input = {
        kb_layout = "us,de";
      };
      general = {
        border_size = 3;
        "col.active_border" = "$mauve $flamingo 90deg";
        "col.inactive_border" = "$subtext0";
        resize_on_border = true;
        gaps_in = 4;
        gaps_out = 8;
        layout = "dwindle";
      };
      decoration = {
        rounding = 4;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92 "
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "fluent_decel, 0.1, 1, 0, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1" 
         ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 2.5, md3_decel"
          "workspaces, 1, 3.5, easeOutExpo, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };
    };

  };
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono NF Mono 12";
    location = "top";
    extraConfig = {
      modi = "drun";
    };
  };
  programs.waybar = {
    enable = true;
    
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["/home/karl/Pictures/nix.png"];
      wallpaper = ["HDMI-A-1,/home/karl/Pictures/nix.png"];
    };
  };
  programs.hyprlock = {
    enable = true;
    settings = { 
      background = [{path = "/home/karl/Pictures/nix.png";}];
      input-field = [{
        monitor = "";
        size = "300, 60";
        outline_thickness = "4";
        dots_size = "0.2";
        dots_center = true;
        outer_color = "$muave";
        inner_color = "$surface0";
        font_color = "$text";
        fade_on_empty = false;
        hide_input = false;
        check_color = "$muave";
        fail_color = "$red";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = "$red";
        position = "0, -35";
        halign = "center";
        valign = "center";
      }]; 
    };
  };
  gtk = {
    enable = true;
    font.name = "JetBrainsMono NF Mono 12";
    catppuccin.enable = true;
    catppuccin.icon.enable = true;
  };
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };
  catppuccin.pointerCursor.enable = true;
}
