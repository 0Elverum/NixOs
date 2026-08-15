{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/mainUser.nix
      ./modules/apps.nix
      ./modules/git.nix
      ./modules/networking.nix
      ./modules/locales.nix
      ./modules/flatpak.nix
      ./modules/niri.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.consoleMode = "max";

  # DisplayManager
  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    defaultSession = "niri";
    };

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Opengl
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Other Services
  services = {
    upower.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };

  # Programs
  programs = {
    
    localsend = {
      enable = true;
      openFirewall = true;
    };

    gamemode.enable = true;
    steam = {
      enable = true;
      protontricks.enable = true;
    };

    xfconf.enable = true;
    dconf.enable = true;
    thunar.enable = true;
    firefox.enable = true;
    obs-studio.enable = true;
  };

  # Environment variables
  environment = {
    shellAliases = {
      cdnix = "cd /etc/nixos";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Cleaning/optimise storage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
    };

  system.stateVersion = "26.05";
}
