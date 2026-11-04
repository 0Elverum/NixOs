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

    # Fonts
    font-manager

    # Audio/Video
    picard
    mpv
    kew
    
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
    xarchiver
    nicotine-plus
    proton-vpn
    vesktop

    # Flakes
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
  ];
}
