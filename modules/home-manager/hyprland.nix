{
  pkgs,
  inputs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "systemctl --user start hyprpolkitagent.service"
      ];
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
    font = "JetBrainsMono Nerd Font Mono 12";
    location = "top";
    extraConfig = {
      modi = "drun";
    };
  };
  programs.waybar = {
    enable = true;
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "modules-left" = ["clock" "disk" "memory" "cpu" "hyprland/window"];
        "modules-center" = ["hyprland/workspaces"];
        "modules-right" = ["pulseaudio" "network"];
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "1" = " ";
            "2" = " ";
            "3" = " ";
          };
        };
        "clock" = {
          "format" = "{:%I:%M:%S %p}";
          "interval" = "1";
          "tooltip-format" = "\n<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "calendar-weeks-pos" = "right";
          "today-format" = "<span color='#7645AD'><b><u>{}</u></b></span>";
          "format-calendar" = "<span color='#aeaeae'><b>{}</b></span>";
          "format-calendar-weeks" = "<span color='#aeaeae'><b>W{:%V}</b></span>";
          "format-calendar-weekdays" = "<span color='#aeaeae'><b>{}</b></span>";
        };
        "network" = {
          "format-wifi" = " ";
          "format-ethernet" = " ";
          "format-disconnected" = " ";
          "tooltip-format" = "{ipaddr}";
          "tooltip-format-wifi" = "{essid} ({signalStrength}%)  | {ipaddr}";
          "tooltip-format-ethernet" = "{ifname} 🖧 | {ipaddr}";
          "on-click" = "networkmanager_dmenu";
        };
        "disk" = {
          "interval" = 30;
          "format" = "  {percentage_used}%";
          "path" = "/";
        };
        "cpu" = {
          "interval" = 1;
          "format" = " {usage}%";
          "min-length" = 6;
          "max-length" = 6;
          "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };
        "memory" = {
          "format" = " {percentage}%";
        };
        "hyprland/window" = {
          "format" = "( {class} )";
          "rewrite" = {
            "(.*) - Mozilla Firefox" = " $1";
            "(.*) - zsh" = "> [$1]";
          };
        };
        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-bluetooth" = "󰂰";
          "format-muted" = "<span font='12'> </span>";
          "format-icons" = {
            "headphones" = " ";
            "bluetooth" = "󰥰 ";
            "handsfree" = " ";
            "headset" = "󱡬";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
            "default" = ["🕨" "🕩" "🕪"];
          };
          "justify" = "center";
          "on-click" = "amixer sset Master toggle";
          "on-click-right" = "pavucontrol";
          "tooltip-format" = "{icon}  {volume}%";
        };
      }
    ];
    style =
      #css
      ''
        * {
            border: none;
            font-size: 14px;
            font-family: "JetBrainsMono Nerd Font,JetBrainsMono NF" ;
            min-height: 25px;
        }
        window#waybar {
          background: transparent;
          margin: 5px;
         }
        .modules-right {
          padding-left: 5px;
          border-radius: 15px 0 0 15px;
          margin-top: 2px;
          background: #000000;
        }
        .modules-center {
          padding: 0 15px;
          margin-top: 2px;
          border-radius: 15px 15px 15px 15px;
          background: #000000;
        }
        .modules-left {
          border-radius: 0 15px 15px 0;
          margin-top: 2px;
          background: #000000;
        }
        #pulseaudio,
        #network,
        #disk,
        #memory,
        #cpu,
        #window,
        #workspaces,
        #clock {
          padding: 0 5px;
        }
        #pulseaudio {
          padding-top: 3px;
        }
        #pulseaudio.muted {
          color: #FF0000;
          padding-top: 0;
        }
        #clock{
          color: #5fd1fa;
        }
      '';
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
      input-field = [
        {
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
        }
      ];
    };
  };
  gtk = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono 12";
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
