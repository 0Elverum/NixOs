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
      ./modules/session.nix
    ];

  # Bootloader
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.consoleMode = "max";

    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ntfs" ];
  };

  # Swap
  boot.initrd.systemd.enable = true;
  boot.zswap.enable = true;

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

  # Suspend when the lid is close
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
  };

  # Other Services
  services = {
    upower.enable = true;
    gvfs.enable = true;     # Mount, trash, and other functionalities
    tumbler.enable = true;  # Thumbnail support for images
  };

  # Programs
  programs = {
    thunar = {
      enable = true;
      plugins = [
        pkgs.thunar-archive-plugin
        pkgs.thunar-volman
      ];
    };

    localsend = {
      enable = true;
      openFirewall = true;
    };

    steam = {
      enable = true;
      protontricks.enable = true;
    };

    xfconf.enable = true;     # Required to save Thunar settings
    dconf.enable = true;      # Required to save GTK settings
    firefox.enable = true;
    obs-studio.enable = true;
  };

  # Environment variables
  environment = {
    sessionVariables = {
      TERMINAL = "foot";
      NIXOS_OZONE_WL = "1";
    };
    
    shellAliases = {
      cdnix = "cd /etc/nixos";
    };
  };

  # NixConfig
  nix.settings = {
    auto-optimise-store = true;

    # Cache for flakes
    trusted-users = [ "@wheel" ];
    
    extra-substituters = [
      "https://nix-gaming.cachix.org"
    ];
    
    extra-trusted-public-keys = [
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

  system.stateVersion = "26.05";
}
