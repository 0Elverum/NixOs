{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/apps.nix
      ./modules/git.nix
      ./modules/networking.nix
      ./modules/NixFlatpak.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.consoleMode = "max";

  # Set your time zone.
  time.timeZone = "America/Caracas";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_VE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_VE.UTF-8";
    LC_IDENTIFICATION = "es_VE.UTF-8";
    LC_MEASUREMENT = "es_VE.UTF-8";
    LC_MONETARY = "es_VE.UTF-8";
    LC_NAME = "es_VE.UTF-8";
    LC_NUMERIC = "es_VE.UTF-8";
    LC_PAPER = "es_VE.UTF-8";
    LC_TELEPHONE = "es_VE.UTF-8";
    LC_TIME = "es_VE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Opengl
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."elverum" = {
    isNormalUser = true;
    description = "Elverum";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    # Packages only for this user.
    ];
  };

  # Programs
  programs.gnome-terminal.enable = true;
  programs.fuse.enable = true;
  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.firefox.enable = true;
  programs.obs-studio.enable = true;
  
  # Flatpak module
  NixFlatpak = {
    enable = true;
    remotes = [];
    packages = [
      "org.vinegarhq.Sober"
      "com.stremio.Stremio"
      "org.onlyoffice.desktopeditors"
      ];
    };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Home Manager
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.elverum = import ./modules/home.nix;
  };

  # Cleaning storage
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
