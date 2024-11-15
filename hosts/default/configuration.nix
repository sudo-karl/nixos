# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/nixos/default.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # Bootloader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.sddm.package = pkgs.kdePackages.sddm;
  services.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  programs.hyprland = {
    enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  users.users.karl = {
    isNormalUser = true;
    description = "Karl Hatopp";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "karl" = import ./home.nix; };
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  nixpkgs.config.allowUnfree = true;
  catppuccin.enable = true;
  catppuccin.flavor = "mocha";
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = [pkgs.zsh];
  environment.pathsToLink = ["/share/zsh/"];

  environment.systemPackages = with pkgs; [
    file
    discord-screenaudio
    cmatrix
    cowsay
    sl
    glmark2
  ];
  environment.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  }; 
  
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "performance";

  services.openssh = {
    enable = true;
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
