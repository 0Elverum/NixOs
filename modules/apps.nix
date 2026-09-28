{ config, pkgs, inputs, ... }:

  let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # System
    xwayland-satellite

    # Themes/Fonts
    adwaita-icon-theme
    
    # Wine
    wineWow64Packages.stagingFull

    # Fonts
    font-manager

    # Audio/Video
    pwvucontrol
    mpv
    picard
    
    # Image
    photoqt
    gimp
    
    # Office
    onlyoffice-desktopeditors
    obsidian
    drawio
    papers
    mousepad

    # CLI/TUI
    btop
    unstable.concord-tui
    fastfetch
    kew
    _7zz
    unrar

    # Apps
    peazip
    nicotine-plus
    proton-vpn
    vesktop

    # Flakes
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
  ];
}
