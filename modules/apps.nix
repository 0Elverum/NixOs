{ config, pkgs, inputs, ... }:
  let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wineWow64Packages.stagingFull
    winetricks
    font-manager
    papirus-icon-theme
    adwaita-icon-theme
    adw-gtk3
    pwvucontrol
    xarchiver
    mpv
    eog # Eye of Gnome
    gimp
    onlyoffice-desktopeditors
    drawio
    obsidian
    papers
    btop
    mousepad
    proton-vpn
    protonup-qt
    steam-run
    wget2
  ];
}
