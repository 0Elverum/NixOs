{ config, pkgs, inputs, ... }:

  let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Sistema
    xwayland-satellite
    gsettings-desktop-schemas

    # Wine
    wineWow64Packages.stagingFull

    # Fonts
    font-manager

    # Audio/Video
    pwvucontrol
    mpv
    picard
    sayonara
    audacious
    audacious-plugins
    
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
    fastfetch
    cava
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
