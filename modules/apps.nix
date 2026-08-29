{ config, pkgs, inputs, ... }:
  let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    xwayland-satellite

    # Wine
    wineWow64Packages.stagingFull
    winetricks

    # Fonts
    font-manager

    # Themes
    papirus-icon-theme
    adwaita-icon-theme
    adw-gtk3

    # Audio
    pwvucontrol
    tauon
    mpv
    picard
    
    # Image
    photoqt
    gimp

    # Office
    onlyoffice-desktopeditors
    drawio
    obsidian
    papers
    mousepad

    # CLI/TUI
    btop
    steam-run
    wget2
    fastfetch
    hyfetch
    cava

    # Apps
    nicotine-plus
    kdePackages.ark    
    proton-vpn
    protonup-qt

    # Flakes
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
  ];
}
