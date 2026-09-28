{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/storage.nix
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
  boot.supportedFilesystems = [ "ntfs" ];

  # DisplayManager
  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    defaultSession = "niri";
    };

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hardware
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;
  zramSwap.enable = true;

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
    sessionVariables = {
      TERMINAL = "foot";
    };
    
    shellAliases = {
      cdnix = "cd /etc/nixos";
    };
  };

  # Cachix
  nix.settings = {
    substituters = [
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Appimage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

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
