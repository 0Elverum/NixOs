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

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Opengl
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    };

  # Steam
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # Gnome
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome = {
    core-apps.enable = false;
    games.enable = false;
    core-developer-tools.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
  ];  

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.excludePackages = with pkgs; [ xterm ];

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

  # Enable touchpad support
  # services.xserver.libinput.enable = true;

  # Programs
  programs.gnome-terminal.enable = true;
  programs.firefox.enable = true;
  programs.obs-studio.enable = true;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}