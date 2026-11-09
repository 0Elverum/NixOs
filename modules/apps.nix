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
    
    # Games
    unstable.faugus-launcher
    mangohud

    # Fonts
    font-manager

    # Audio/Video
    picard
    mpv
    kew
    cava

    qview
    
    # Image
    photoqt
    gimp
    
    # Office
    onlyoffice-desktopeditors
    obsidian
    drawio
    papers
    mousepad
    gnome-calculator

    # CLI/TUI
    btop
    unrar

    # Apps
    file-roller
    nicotine-plus
    proton-vpn
    vesktop

    # Flakes
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
  ];
}
